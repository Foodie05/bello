import 'package:isar/isar.dart';
import './account.dart';
import '../../global/value.dart';
import './account_data_struct.dart';

Future<List<String>> accountPermissionCertificate(AccountDataStruct loginUser,int targetAccountPermission,bool canBeHigher) async{
  //this function's result's list must be ['bool','Info']
  //when result is false, info is error info, when result is true, info is accountsID
  //login user's structure:
  //you login with phoneNumber/email/accountsID
  //you must provide passwdMd5 and passwdSha256
  String loginID;//phoneNumber/email/accountsID
  String passwdMd5=loginUser.passwdMd5;
  String passwdSha256=loginUser.passwdSha256;
  int loginMode=0;
  //check loginID
  if(loginUser.phoneNumber!=''){
    loginID=loginUser.phoneNumber;
    loginMode=1;
  }else if(loginUser.email!=''){
    loginID=loginUser.email;
    loginMode=2;
  }else if(loginUser.accountsID!=''){
    loginID=loginUser.accountsID;
    loginMode=3;
  }else{
    return ['false','No any id found'];
  }
  late List<Accounts> userAccount;
  if(loginMode==1){//使用手机号码登陆
    userAccount=await account.accounts.filter().phoneNumberEqualTo(loginID).findAll();
  }else if(loginMode==2){//使用邮箱登陆
    userAccount=await account.accounts.filter().emailEqualTo(loginID).findAll();
  }else{//使用账号ID登陆
    userAccount=await account.accounts.filter().accountsIDEqualTo(loginID).findAll();
  }
  if(userAccount.isEmpty){//没有查找到账号
    return ['false','Incorrect user or password.'];
  }
  if(passwdMd5==userAccount[0].passwdMd5&&passwdSha256==userAccount[0].passwdSha256){//两个登陆凭证全部一致
    int userAccountPermission=userAccount[0].accountPermission;
    if(userAccountPermission>targetAccountPermission){//the value who is higher is actually lower
      return['false','Permission denied'];
    }else if(userAccountPermission==targetAccountPermission){
      return ['true',userAccount[0].accountsID];
    }else if(userAccountPermission<targetAccountPermission&&canBeHigher==true){
      return ['true',userAccount[0].accountsID];
    }else{
      return ['false','Unknown error'];
    }
  }else{
    return ['false','Incorrect user or password'];
  }
}