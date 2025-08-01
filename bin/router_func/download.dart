import 'dart:io';
import 'package:shelf/shelf.dart';
import '../global/value.dart';

String _downloadDirectory=webDownloadDirectory;

var downloadHandler=(Request request, String fileName) async {
  // 文件所在的目录路径
  final directory = Directory(_downloadDirectory); // 你可以根据需要更改这个目录

  // 查找文件
  final file = File('${directory.path}/$fileName');

  // 检查文件是否存在
  if (await file.exists()) {
    // 读取文件的字节内容
    final fileBytes = await file.readAsBytes();

    // 返回文件作为响应
    return Response.ok(
      fileBytes,
      headers: {
        'Content-Type': 'application/octet-stream',
        'Content-Disposition': 'attachment; filename="$fileName"',
      },
    );
  } else {
    // 如果文件不存在，返回 404 错误
    return Response.notFound('File not found: $fileName');
  }
};