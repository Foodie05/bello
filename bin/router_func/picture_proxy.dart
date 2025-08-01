import 'package:shelf/shelf.dart';
import 'package:http/http.dart' as http;

var pictureProxy=(Request request,String url) async {
  url=url.replaceAll('%3A', ':');
  url=url.replaceAll('%2F', '/');
  print(url);
  final response = await http.get(Uri.parse(url));


  return Response.ok(
      response.bodyBytes,
      headers: {
        'Content-Type': response.headers['content-type'] ?? 'application/octet-stream',
      });
};