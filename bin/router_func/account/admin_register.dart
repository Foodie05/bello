import 'dart:io';
import 'package:isar/isar.dart';
import 'package:shelf/shelf.dart';
import './account.dart';
import '../../global/value.dart';
import './account_data_struct.dart';
var adminRegister=(Request request)async{
  final userInfo=await request.readAsString();//获取注册表单
  AccountDataStruct accountData=AccountDataStruct.decodeToData(userInfo);
  //读取申请表单-首先验证管理员自身信息
  late List<Accounts> admin;
  admin=await account.accounts.filter().accountsIDEqualTo(accountData.adminAccountsID).findAll();
  if(admin.isNotEmpty){//如果用户非空
    if(admin[0].passwdMd5==accountData.adminPasswdMd5&&admin[0].passwdSha256==accountData.adminPasswdSha256){//如果密码匹配
      if(admin[0].accountPermission!=0&&admin[0].accountPermission!=1){//只有0级和1级账号可以添加新账号
        return Response.notFound(AccountDataStruct(msg: 'Admin not permitted',statusCode: 404).encodeToJson());
      }
      //接下来验证申请注册的用户信息
      if(int.tryParse(accountData.phoneNumber)!=null){//电话号码必须是纯数字
        late List<Accounts> newUser;
        newUser=await account.accounts.filter().phoneNumberEqualTo(accountData.phoneNumber).findAll();
        if(newUser.isEmpty){
          if(admin[0].accountPermission==1&&accountData.accountPermission==0){
            return Response.notFound(AccountDataStruct(msg: 'Creating super admin is not allowed for admin',statusCode: 404).encodeToJson());
          }
          String permissionLetter;
          switch(accountData.accountPermission){
            case 0:
              permissionLetter='A';
              break;
            case 1:
              permissionLetter='B';
              break;
            case 2:
              permissionLetter='C';
              break;
            case 3:
              permissionLetter='D';
              break;
            case 5:
              permissionLetter='F';
              break;
            default:
              permissionLetter='E';
              break;
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
          String accountId='$permissionLetter$realIDNumber${accountData.phoneNumber.substring(accountData.phoneNumber.length-4)}';//accountID=账号权限等级+注册号+手机后四位
          Accounts newAccount=Accounts(
              accountsID: accountId,
              phoneNumber: accountData.phoneNumber,
              accountPermission: accountData.accountPermission,
              passwdMd5: accountData.passwdMd5,
              passwdSha256: accountData.passwdSha256,
              registerTime: DateTime.now(),
              nickName: '',
              isInit: false
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

        }else{
          return Response.notFound(AccountDataStruct(msg: 'This phone number has been used or user permission invalid',statusCode: 404).encodeToJson());
        }
      }else{
        return Response.notFound(AccountDataStruct(msg: 'Invalid user phone number',statusCode: 404).encodeToJson());
      }
    }else{
      return Response.notFound(AccountDataStruct(msg: 'Admin passwd invalid',statusCode: 404).encodeToJson());
    }
  }else{
    return Response.notFound(AccountDataStruct(msg: 'Incorrect Admin',statusCode: 404).encodeToJson());
  }
};