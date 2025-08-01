import 'dart:convert';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:shelf/shelf.dart';
import 'article_data_struct.dart';
import 'article.dart';
import '../account/account_permission_certificate.dart';
import '../account/account_data_struct.dart';
import '../../global/value.dart';
var getArticle=(Request request) async {
  final requestInfo=await request.readAsString();//获取登陆表单
  ArticleDataStruct articleData=ArticleDataStruct.decodeToData(requestInfo);
  if(articleData.msg=='submit'){//单篇文章的提交
    //验证身份
    AccountDataStruct accountDataStruct=AccountDataStruct(msg: 'submit');
    accountDataStruct.accountsID=articleData.accountsID;
    accountDataStruct.passwdMd5=articleData.passwdMd5;
    accountDataStruct.passwdSha256=articleData.passwdSha256;
    List<String> status=await accountPermissionCertificate(accountDataStruct, 2, true);
    if(status[0]=='true'){//验证成功，录入文章
      if(articleData.articleDetail.isEmpty){
        return Response.notFound(ArticleDataStruct('Submit failed: Form is broken').encodeToJson());
      }
      ArticleDetail currentArticle=articleData.articleDetail[0];
      Article articleIsar=Article(
          title: currentArticle.title, 
          author: currentArticle.author, 
          label1: currentArticle.label1, 
          label2: currentArticle.label2, 
          label3: currentArticle.label3, 
          label4: currentArticle.label4, 
          label5: currentArticle.label5,
          accountsID: articleData.accountsID,
          time: DateTime.now(), 
          viewCount: 0, 
          visiblePermission: currentArticle.visiblePermission, 
          txt: currentArticle.txt, 
          coverPic: currentArticle.coverPic
      );
      article.writeTxn(()async{
        article.articles.put(articleIsar);
      });
      return Response.ok(ArticleDataStruct('success').encodeToJson());
    }else{
      return Response.notFound(ArticleDataStruct(status[1]).encodeToJson());
    }
  }else if(articleData.msg=='list'){//获取文章列表-如果带有articles,则应检查filter过滤器
    ArticleDataStruct articleDataStruct=ArticleDataStruct('list passage');
    List<Article> articles=[];
    if(articleData.articleDetail.isNotEmpty){//非空时检查过滤器并按过滤器返回
      //目前过滤器仅可有一个：优先级：accountsID->label
      if(articleData.articleDetail[0].accountsID!=''){//如果非空，则按照accountID查找
        articles=await article.articles.filter().accountsIDEqualTo(articleData.articleDetail[0].accountsID).findAll();
      }else if(articleData.articleDetail[0].label1!=''){//按照标签查找:所有标签位置都要遍历
        articles=await article.articles.filter().label1EqualTo(articleData.articleDetail[0].label1).findAll();
        articles+=await article.articles.filter().label2EqualTo(articleData.articleDetail[0].label1).findAll();
        articles+=await article.articles.filter().label3EqualTo(articleData.articleDetail[0].label1).findAll();
        articles+=await article.articles.filter().label4EqualTo(articleData.articleDetail[0].label1).findAll();
        articles+=await article.articles.filter().label5EqualTo(articleData.articleDetail[0].label1).findAll();
      }else{
        articles=[];
      }
    }else{//没有给定信息，全部列表返回
      articles=await article.articles.where().findAll();
    }
    List<ArticleDetail> listArticles=[];
    for(int i=0;i<articles.length;i++){
      ArticleDetail articleDetail=ArticleDetail(
          title: articles[i].title,
          author:articles[i].author,
          time: articles[i].time,
          viewCount: articles[i].viewCount,
          visiblePermission: articles[i].visiblePermission,
          txt: articles[i].txt,
          coverPic: articles[i].coverPic,
          articleID: articles[i].id,
          label1: articles[i].label1,
          label2: articles[i].label2,
          label3: articles[i].label3,
          label4: articles[i].label4,
          label5: articles[i].label5,
          accountsID: articles[i].accountsID
      );
        listArticles.add(articleDetail);
    }
    articleDataStruct.articles=listArticles;
    return Response.ok(articleDataStruct.encodeToJson());
  }else if(articleData.msg=='checkID'){//查询指定的文章
    if(articleData.articleDetail.isNotEmpty){
      ArticleDataStruct articleDataStruct=ArticleDataStruct('check passage');
      List<Article> articles=await article.articles.filter().idEqualTo(articleData.articleDetail[0].articleID).findAll();
      List<ArticleDetail> listArticles=[];
      for(int i=0;i<articles.length;i++){
        ArticleDetail articleDetail=ArticleDetail(
            title: articles[i].title,
            author:articles[i].author,
            time: articles[i].time,
            viewCount: articles[i].viewCount,
            visiblePermission: articles[i].visiblePermission,
            txt: articles[i].txt,
            coverPic: articles[i].coverPic,
            articleID: articles[i].id,
            label1: articles[i].label1,
            label2: articles[i].label2,
            label3: articles[i].label3,
            label4: articles[i].label4,
            label5: articles[i].label5,
            accountsID: articles[i].accountsID
        );
        listArticles.add(articleDetail);
      }
      articleDataStruct.articles=listArticles;
      articles[0].viewCount+=1;
      article.writeTxn(()async{
        await article.articles.filter().idEqualTo(articleData.articleDetail[0].articleID).deleteAll();
        await article.articles.put(articles[0]);
      });
      return Response.ok(articleDataStruct.encodeToJson());
    }else{
      return Response.notFound(ArticleDataStruct('Passage Not Found').encodeToJson());
    }
  }else if(articleData.msg=='del_article'){//使用文章id删除文章
    if(articleData.articleDetail[0].articleID==0){
      return Response.notFound('No such article or form broken');
    }
    if(articleData.accountsID==''||articleData.passwdMd5==''||articleData.passwdSha256==''){
      return Response.notFound('Account invalid');
    }
    //一级以上用户或作者本人才能删除文章
    AccountDataStruct accountDataStruct=AccountDataStruct(msg: '',accountsID: articleData.accountsID,passwdMd5: articleData.passwdMd5,passwdSha256: articleData.passwdSha256);
    List<String> results=await accountPermissionCertificate(accountDataStruct, 1, true);
    List<String> newResults=await accountPermissionCertificate(accountDataStruct, 5, true);
    List<Article> articles=await article.articles.filter().idEqualTo(articleData.articleDetail[0].articleID).findAll();
    if(results[0]=='false'&&newResults[0]=='false'){//不是本人或者不是管理员-权限问题或身份验证失败
      return Response.notFound('Error: ${results[1]},${newResults[1]}');
    }
    if(articles.isEmpty){
      return Response.notFound('Error: no such article found');
    }
    if(results[0]=='true'){//如果是管理员用户，准许删除
      article.writeTxn(()async{
        article.articles.filter().idEqualTo(articleData.articleDetail[0].articleID).deleteFirst();//谨慎一些，只删除一个
      });
      return Response.ok('success');
    }else if(results[1]=='true'){//如果是用户，核准accountsID
      if(accountDataStruct.accountsID==articles[0].accountsID){
        article.writeTxn(()async{
          article.articles.filter().idEqualTo(articleData.articleDetail[0].articleID).deleteFirst();//谨慎一些，只删除一个
        });
        return Response.ok('success');
      }else{
        return Response.notFound('Error: permission denied: not paired article');
      }
    }else{
      return Response.notFound('unknown error');
    }
  }else if(articleData.msg=='get_label'){//查询标签
   File labels=File("$webArticleDir$webArticleLabels");
   if(await labels.exists()==false){
     labels.create();
   }
   String readFile=await labels.readAsString();
   return Response.ok(readFile);
  }else if(articleData.msg=='add_label'){//添加标签
    //添加标签需要验证用户身份
    if(articleData.accountsID==''||articleData.passwdMd5==''||articleData.passwdSha256==''){
      return Response.notFound('Account invalid');
    }
    //二级以上用户才能添加标签
    AccountDataStruct accountDataStruct=AccountDataStruct(msg: '',accountsID: articleData.accountsID,passwdMd5: articleData.passwdMd5,passwdSha256: articleData.passwdSha256);
    List<String> results=await accountPermissionCertificate(accountDataStruct, 2, true);
    if(results[0]=='false'){
      return Response.notFound('Error: ${results[1]}');
    }
    //验证成功后，方可继续下行
    File labels=File("$webArticleDir$webArticleLabels");
    if(await labels.exists()==false){
      labels.create();
    }
    if(articleData.articleDetail.isEmpty){
      return Response.notFound('Form is broken');
    }
    String readFile=await labels.readAsString();
    List<String> labelList=[];
    if(readFile.isNotEmpty){//文件刚建立
      var decode=jsonDecode(readFile);
      labelList=List<String>.from(decode);
    }
    if(articleData.articleDetail[0].label1!=''&&articleData.articleDetail[0].label1.length<30){
      if(!labelList.contains(articleData.articleDetail[0].label1)){//不能有重复的标签
        labelList.add(articleData.articleDetail[0].label1);//规定从label1中添加数据
        String write=jsonEncode(labelList);
        labels.writeAsString(write);
        return Response.ok('success');
      }else{
        return Response.notFound('Label already existed');
      }
    }else{
      return Response.notFound('Label isEmpty or label is too long(>30)');
    }
  }else{
    return Response.notFound(ArticleDataStruct('Command not found').encodeToJson());
  }
};