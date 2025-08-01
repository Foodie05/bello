import 'package:isar/isar.dart';
import 'package:shelf/shelf.dart';
import './account.dart';
import '../../global/value.dart';
import './account_data_struct.dart';
var loginTwice=(Request request)async{//二次登陆补充信息时使用，支持修改除ID之外的所有信息
  final userInfo=await request.readAsString();//获取登陆表单
  AccountDataStruct accountData=AccountDataStruct.decodeToData(userInfo);
  //检查必要数据和操作合法性
  if(accountData.accountsID==''||accountData.passwdMd5==''||accountData.passwdSha256==''){
    return Response.notFound(AccountDataStruct(msg: 'Account info not completed',statusCode: 404).encodeToJson());
  }
  List<Accounts> initAccount=await account.accounts.filter().accountsIDEqualTo(accountData.accountsID).findAll();
  if(initAccount.isEmpty){
    return Response.notFound(AccountDataStruct(msg: 'No such account found',statusCode: 404).encodeToJson());
  }
  if(initAccount[0].passwdMd5==accountData.passwdMd5&&initAccount[0].passwdSha256==accountData.passwdSha256){//密码校验通过，更新用户数据
    if(accountData.email!=''){//检查更新的email是否合法（有没有使用过）
      List<Accounts> checkEmail=await account.accounts.filter().emailEqualTo(accountData.email).findAll();
      if(checkEmail.isNotEmpty){//邮件使用过，拒绝更新信息
        return Response.notFound(AccountDataStruct(msg: 'Email is used',statusCode: 404).encodeToJson());
      }
    }
    initAccount[0].isInit=true;//login twice之后必然为true
    if(accountData.newPasswdMd5!=''&&accountData.newPasswdSha256!=''){
      initAccount[0].passwdMd5=accountData.newPasswdMd5;
      initAccount[0].passwdSha256=accountData.newPasswdSha256;
    }
    if(accountData.nickName!=''){
      initAccount[0].nickName=accountData.nickName;
    }
    if(accountData.signature!=''){
      initAccount[0].signature=accountData.signature;
    }
    if(accountData.email!=''){
      initAccount[0].email=accountData.email;
    }
    if(accountData.gender!=''){
      initAccount[0].gender=accountData.gender;
    }
    //替换完成，更新数据
    await account.writeTxn(() async {//写入新数据
      await account.accounts.delete(initAccount[0].id);
    });
    await account.writeTxn(() async {//写入新数据
      await account.accounts.put(initAccount[0]);
    });
    return Response.ok(AccountDataStruct(
        msg: 'success',
        statusCode: 200,
        nickName: initAccount[0].nickName,
        accountsID: initAccount[0].accountsID,
        registerTime: initAccount[0].registerTime,
        accountPermission: initAccount[0].accountPermission,
        accountLevel: initAccount[0].accountLevel,
        signature: initAccount[0].signature,
        email: initAccount[0].email,
        phoneNumber: initAccount[0].phoneNumber
    ).encodeToJson());
  }else{
    return Response.notFound(AccountDataStruct(msg: 'Incorrect account or password.',statusCode: 404).encodeToJson());
  }


};