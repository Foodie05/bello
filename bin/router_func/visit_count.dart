import 'dart:convert';
import 'dart:io';
import '../global/value.dart';
import 'package:shelf/shelf.dart';

String _visitDirectory=webVisitDirectory;

var getVisits=(Request request) async {
  int times = 0;
  int version=0;
  // 加载访问次数（可以扩展为从数据库加载）
  Directory homeDir=Directory(_visitDirectory);
  if(!await homeDir.exists()){
    homeDir.create();
  }
  final File timesFile = File('${homeDir.path}timesRecord.json');
  if (await timesFile.exists()) {
    final contents = await timesFile.readAsString();
    times = jsonDecode(contents)['times'] ?? 0;
    version=jsonDecode(contents)['version']??0;
  }
  return Response.ok(jsonEncode({'times': times,'version':version}), headers: {
    'Content-Type': 'application/json',
  });
};

var updateVisits=(Request request) async {
  int times = 0;
  int version=0;
  Directory homeDir=Directory(_visitDirectory);
  if(!await homeDir.exists()){
    homeDir.create();
  }
  // 加载访问次数（可以扩展为从数据库加载）
  final File timesFile = File('${homeDir.path}timesRecord.json');
  if (await timesFile.exists()) {
    final contents = await timesFile.readAsString();
    times = jsonDecode(contents)['times'] ?? 0;
    version=jsonDecode(contents)['version']??0;
  }
  times++;
  await timesFile.writeAsString(jsonEncode({'times': times,'version':version}));
  return Response.ok(jsonEncode({'times': times,'version':version}), headers: {
    'Content-Type': 'application/json',
  });
};