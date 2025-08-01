import 'dart:io';
import '../router_func/article/article.dart';
import 'package:isar/isar.dart';
import '../router_func/account/account.dart';
import './value.dart';

Future<bool> initDirAndFile() async{
  //final result
  bool result=true;
  //dirs list
  List<Directory> initDirs=[
    Directory(webHomeDir),
    Directory(webKeyDir),
    Directory(webDownloadDirectory),
    Directory(webVisitDirectory),
    Directory(webAccountDirectory),
    Directory(webArticleDir)
  ];
  //init dirs
  for(int i=0;i<initDirs.length;i++){
    if(!await initDirs[i].exists()){
      try{
        await initDirs[i].create();
      }catch(e){
        print('Error: $e');
        result=false;
      }
    }
  }
  //files list
  List<File> initFiles=[
    File(webCertificateChain),
    File(webCertificatePrivateKey),
  ];
  //check files
  for(int i=0;i<initFiles.length;i++){
    if(!await initFiles[i].exists()){
      print('Error: ${initFiles[i].toString()} not exists');
      result=false;
    }
  }
  //init account isar
  try{
    Isar? initAccount=await loadAccount();
    if(initAccount==null){
      print('Error: Error occurred while init isar account because null value returned');
      result=false;
    }else{
      account=initAccount;
    }
  }catch(e){
    print('Error: $e');
    result=false;
  }
  //init article isar
  try{
    Isar? initArticle=await loadArticle();
    if(initArticle==null){
      print('Error: Error occurred while init isar article because null value returned');
      result=false;
    }else{
      article=initArticle;
    }
  }catch(e){
    print('Error: $e');
    result=false;
  }
  return result;
}