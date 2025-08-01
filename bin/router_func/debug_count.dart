import 'dart:convert';
import 'dart:io';
import '../global/value.dart';
import 'package:shelf/shelf.dart';

var getDebugVisits=(Request request) async {
  int times = 0;
  // 加载访问次数（可以扩展为从数据库加载）
  Directory homeDir=Directory(webVisitDirectory);
  if(!await homeDir.exists()){
    homeDir.create();
  }
  final File timesFile = File('${homeDir.path}debugTimesRecord.json');
  if (await timesFile.exists()) {
  final contents = await timesFile.readAsString();
  times = jsonDecode(contents)['times'] ?? 0;
  }
  return Response.ok(jsonEncode({'times': times}), headers: {
  'Content-Type': 'application/json',
  });
};

var updateDebugVisits=(Request request) async {
  int times = 0;
  Directory homeDir=Directory(webVisitDirectory);
  if(!await homeDir.exists()){
    homeDir.create();
  }
  // 加载访问次数（可以扩展为从数据库加载）
  final File timesFile = File('${homeDir.path}debugTimesRecord.json');
  if (await timesFile.exists()) {
    final contents = await timesFile.readAsString();
    times = jsonDecode(contents)['times'] ?? 0;
  }
  times++;
  await timesFile.writeAsString(jsonEncode({'times': times}));
  print('times:$times');
  return Response.ok(jsonEncode({'times': times}), headers: {
    'Content-Type': 'application/json',
  });
};