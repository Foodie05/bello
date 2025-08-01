import 'dart:convert';
import 'dart:io';
import 'package:isar/isar.dart';
import 'package:shelf/shelf.dart';
import './account_permission_certificate.dart';
import './account.dart';
import '../../global/value.dart';
import './account_data_struct.dart';
adminAccountMgr(request){
  bool isCertificated=false;
  // Upgrade to WebSocket and handle communication
  WebSocketTransformer.upgrade(request).then((webSocket) {
    webSocket.listen((data) async {
      if(isCertificated==false){//先做验证，再决定是否建立连接
        AccountDataStruct accountData=AccountDataStruct.decodeToData(data);
        List<String> result=await accountPermissionCertificate(
            accountData,
            1,
            true
        );
        if(result[0]!='true'){
          webSocket.add(AccountDataStruct(msg: 'permission denied',statusCode: 404).encodeToJson());
          webSocket.close();
          return;
        }else{
          isCertificated=true;
          webSocket.add(AccountDataStruct(msg: 'success',statusCode: 200).encodeToJson());
        }
      }else{//如果已经验证，则进入正常的账户管理
        //数据结构：
        //请求消息->list/del/reset_permission/...
        if(AccountDataStruct.decodeToData(data.toString()).msg=='list'){
          List<Accounts> accounts=await account.accounts.where().findAll();
          List accountList=[];
          for(int i=0;i<accounts.length;i++){
            accountList.add({'accountsID':accounts[i].accountsID,'accountPermission':accounts[i].accountPermission});
          }
          webSocket.add(AccountDataStruct(msg: '',statusCode: 200,accountList:accountList ).encodeToJson());
        }
      }
    });
  }).catchError((e) {
    print('Error handling WebSocket: $e');
  });
}