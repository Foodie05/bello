import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import '../../global/value.dart';
import 'package:isar/isar.dart';
part 'account.g.dart';


/*
账户权限等级说明：
0-A-终极管理
1-B-管理员
2-C-荣誉作者
3-D-高级访客
4-E-普通访客
5-F-黑名单访客
 */
@Collection()
class Accounts{
  Id id=Isar.autoIncrement;//auto increasing id
  //Root Info: 账户的根本信息，当信息录入数据库时，就必须附带
  late String accountsID;//唯一的账户ID，只由系统处理，不由用户修改
  late String phoneNumber;
  late int accountPermission;//账户权限等级
  //After Init：在完整地Init后，下面的信息才是必须的
  late String passwdMd5;//密码的Md5校验
  late String passwdSha256;//密码的Sha256校验
  late DateTime registerTime;//注册时间，由系统自动填写
  late String nickName;//昵称
  String? gender;//性别，可不填
  String? signature;//个性签名
  String? email;
  int? accountLevel;//账户成长等级信息
  //Init Sign：Init：邀请制注册的过程，包括管理员预先注册账号（第一次注册，isInit标记false，然后再由用户自己填写更多信息，isInit标记true）
  late bool isInit;

  //构造函数
  Accounts({
    required this.accountsID,
    required this.phoneNumber,
    required this.accountPermission,
    required this.passwdMd5,
    required this.passwdSha256,
    required this.registerTime,
    required this.nickName,
    required this.isInit,
    this.email,
    this.gender,
    this.signature,
    this.accountLevel
  });
}

Future<Isar?> loadAccount() async{
  /*File isarDb=File('$webAccountDirectory$webAccountIsarName.isar');
  if(!await isarDb.exists()){
    //first init
    print('You are initializing the account data the first time');
    String realPhoneNumber='';
    while(true){
      print('Please provide your phone number to create an admin account');
      String? phoneNumber=stdin.readLineSync();
      if(phoneNumber==null||int.tryParse(phoneNumber)==null||phoneNumber.length<4){
        print('phone number can\'t be null and must be pure number,try again');
      }else{
        realPhoneNumber=phoneNumber;
        break;
      }
    }
    File accountID=File('${webAccountDirectory}IDNumber');//记录注册的用户序号用
    try{
      await accountID.create();
    }catch(e){
      print('Error: $e');
      return null;
    }
    String idNumber=await accountID.readAsString();
    if(int.tryParse(idNumber)==null){
      idNumber='0';
    }
    int realIDNumber=int.parse(idNumber);
    realIDNumber+=1;
    await accountID.writeAsString(realIDNumber.toString());
    String accountId='A$realIDNumber${realPhoneNumber.substring(realPhoneNumber.length-4)}';//accountID=账号权限等级+注册号+手机后四位
    var passwdBytes=utf8.encode('hellobello');
    String passwdMd5=md5.convert(passwdBytes).toString();
    String passwdSha256= sha256.convert(passwdBytes).toString();
    Accounts newAccount=Accounts(
        accountsID: accountId,
        phoneNumber: realPhoneNumber,
        accountPermission: 0,
        passwdMd5: passwdMd5,
        passwdSha256: passwdSha256,
        registerTime: DateTime.now(),
        nickName: '',
        isInit: false
    );
    Isar initAccount=await Isar.open([AccountsSchema], directory: webAccountDirectory ,name: webAccountIsarName);
    await initAccount.writeTxn(() async {
      await initAccount.accounts.put(newAccount); // 保存用户数据
    });
    print('Your admin account password is hellobello and now you can try to login');
    return initAccount;

  }*/
  return await Isar.open([AccountsSchema], directory: webAccountDirectory ,name: webAccountIsarName);
}
