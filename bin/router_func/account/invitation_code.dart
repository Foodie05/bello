import 'dart:io';
import 'package:isar/isar.dart';
import '../../global/value.dart';
part 'invitation_code.g.dart';

@Collection()
class InvitationCode{
  Id id=Isar.autoIncrement;
  String code;
  int accountPermission;
  bool isUsed;

  InvitationCode({
    required this.code,
    required this.accountPermission,//0-5
    required this.isUsed
  });
}

Future<Isar?> loadInvitationCode() async{
  return await Isar.open([InvitationCodeSchema], directory: webAccountDirectory ,name: 'codes');
}