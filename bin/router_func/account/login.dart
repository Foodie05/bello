import 'package:isar/isar.dart';
import 'package:shelf/shelf.dart';
import './account.dart';
import '../../global/value.dart';
import './account_permission_certificate.dart';
import './account_data_struct.dart';

var login=(Request request)async{
  final userInfo=await request.readAsString();//获取登陆表单
  AccountDataStruct accountData=AccountDataStruct.decodeToData(userInfo);
  //登陆结构
  if(accountData.loginMode<1||accountData.loginMode>3){//模式选项必须在范围之内
    return Response.notFound(AccountDataStruct(msg: 'Request form is broken',statusCode: 404).encodeToJson());
  }
  //数据检查完成，没有问题
  String realLoginMode='';
  AccountDataStruct certificateData=AccountDataStruct(
    msg: '',
    passwdMd5: accountData.passwdMd5,
    passwdSha256: accountData.passwdSha256,
  );
  if(accountData.loginMode==1){
    realLoginMode='phoneNumber';
    certificateData.phoneNumber=accountData.phoneNumber;
  }else if(accountData.loginMode==2){
    realLoginMode='email';
    certificateData.email=accountData.email;
  }else if(accountData.loginMode==3){
    certificateData.accountsID=accountData.accountsID;
  realLoginMode=certificateData.accountsID;
  }else{
    return Response.notFound(AccountDataStruct(msg: 'Incorrect login',statusCode: 404).encodeToJson());
  }
  List<String> user=await accountPermissionCertificate(
      certificateData,
      4,
      true);
  if(user[0]=='false') {
    return Response.notFound(AccountDataStruct(msg: 'Incorrect login',statusCode: 404).encodeToJson());
  }else{
    late List<Accounts> userAccount;
    userAccount=await account.accounts.filter().accountsIDEqualTo(user[1]).findAll();
    if(userAccount.isEmpty){
      return Response.notFound(AccountDataStruct(msg: 'Incorrect login',statusCode: 404).encodeToJson());
    }else{
      return Response.ok(
          AccountDataStruct(
              msg: 'success',
              statusCode: 200,
              nickName: userAccount[0].nickName,
              accountsID: userAccount[0].accountsID,
              registerTime: userAccount[0].registerTime,
              accountPermission: userAccount[0].accountPermission,
              accountLevel: userAccount[0].accountLevel,
              signature: userAccount[0].signature,
              email: userAccount[0].email,
              phoneNumber: userAccount[0].phoneNumber
          ).encodeToJson()
      );//准予登陆
    }
  }
};