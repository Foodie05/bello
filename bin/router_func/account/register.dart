import 'dart:io';
import 'package:isar/isar.dart';
import 'package:shelf/shelf.dart';
import './account.dart';
import '../../global/value.dart';
import './account_data_struct.dart';
import 'invitation_code.dart';
var accountRegister=(Request request) async {
  final userInfo=await request.readAsString();//获取注册表单
  AccountDataStruct accountData=AccountDataStruct.decodeToData(userInfo);
  int accountLevel=1;//账户成长等级信息-刚注册时默认是1级
  int accountPermission=4;
  bool isInit=true;
  //首先验证表单是否有效
  if(accountData.phoneNumber==''||accountData.passwdMd5==''||accountData.passwdSha256==''||accountData.nickName==''||accountData.invitationCode=='') {//五个必填项一定要填
    return Response.notFound(AccountDataStruct(msg: 'Register Invalid: Basic info is not enough',statusCode: 404).encodeToJson());
  }
  //检查账号唯一性-检查手机号和邮箱
  List<Accounts> listAccountsByPhone=await account.accounts.filter().phoneNumberEqualTo(accountData.phoneNumber).findAll();
  if(listAccountsByPhone.isNotEmpty){//先检查必要的电话号码
    return Response.notFound(AccountDataStruct(msg: 'Register Invalid: PhoneNumber has already been registered',statusCode: 404).encodeToJson());
  }
  if(accountData.email!=''){//如果提供了邮箱，则也要检查邮箱
    List<Accounts> listAccountsByEmail=await account.accounts.filter().emailEqualTo(accountData.email).findAll();
    if(listAccountsByEmail.isNotEmpty){
      return Response.notFound(AccountDataStruct(msg: 'Register Invalid: Email has already registered',statusCode: 404).encodeToJson());
    }
  }
  //检查邀请码
  Isar? invitationCode=await loadInvitationCode();
  if(invitationCode==null){
    return Response.notFound(AccountDataStruct(msg: 'system error',statusCode: 404).encodeToJson());
  }else{
    List<InvitationCode> inviteCode=await invitationCode.invitationCodes.filter().codeEqualTo(accountData.invitationCode).isUsedEqualTo(false).findAll();
    if(inviteCode.isEmpty){
      invitationCode.close();
      return Response.notFound(AccountDataStruct(msg: 'Register Invalid: invalid invitation code',statusCode: 404).encodeToJson());
    }else{
      accountPermission=inviteCode[0].accountPermission;
      InvitationCode code=InvitationCode(code: inviteCode[0].code, accountPermission: inviteCode[0].accountPermission, isUsed: true);
      invitationCode.writeTxn(()async{
        invitationCode.invitationCodes.filter().codeEqualTo(accountData.invitationCode).isUsedEqualTo(false).deleteAll();
        invitationCode.invitationCodes.put(code);
      });
      invitationCode.close();
    }
  }
  File accountID=File('${webAccountDirectory}IDNumber');//记录注册的用户序号用
  await accountID.create();
  if(await accountID.exists()==false){
    return Response.notFound(AccountDataStruct(msg: 'system error',statusCode: 404).encodeToJson());//这个文件找不到就可以直接终止注册了，报系统错误
  }
  String idNumber=await accountID.readAsString();
  if(int.tryParse(idNumber)==null){
    idNumber='0';
  }
  int realIDNumber=int.parse(idNumber);
  realIDNumber+=1;
  await accountID.writeAsString(realIDNumber.toString());
  String identityCode='E';
  switch(accountPermission){
    case 0:
      identityCode='A';
      break;
    case 1:
      identityCode='B';
      break;
    case 2:
      identityCode='C';
      break;
    case 3:
      identityCode='D';
      break;
    case 4:
      identityCode='E';
      break;
    default:
      identityCode='F';
  }
  String accountId='$identityCode$realIDNumber${accountData.phoneNumber.substring(accountData.phoneNumber.length-4)}';//accountID=账号权限等级+注册号+手机后四位
  //符合要求，予以注册
  Accounts newAccount=Accounts(
      accountsID: accountId,
      phoneNumber: accountData.phoneNumber,
      accountPermission: accountPermission,
      passwdMd5: accountData.passwdMd5,
      passwdSha256: accountData.passwdSha256,
      registerTime: DateTime.now(),
      nickName: accountData.nickName,
      isInit: isInit,
      email: accountData.email,
      gender:accountData.gender,
      signature: accountData.signature,
      accountLevel: accountLevel
  );
  await account.writeTxn(() async {
    await account.accounts.put(newAccount); // 保存用户数据
  });
  return Response.ok(
      AccountDataStruct(
          msg: 'success',
          statusCode: 200,
          nickName: newAccount.nickName,
          accountsID: newAccount.accountsID,
          registerTime: newAccount.registerTime,
          accountPermission: newAccount.accountPermission,
          accountLevel: newAccount.accountLevel,
          signature: newAccount.signature,
          email: newAccount.email,
          phoneNumber: newAccount.phoneNumber
      ).encodeToJson()
  );
};