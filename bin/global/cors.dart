/*

 */

// CORS Middleware function
import 'package:shelf/shelf.dart';

Middleware corsHeaders() {
  return (Handler handler) {
    return (Request request) async {
      final response = await handler(request);

      // set CORS header info
      return response.change(headers: {
        'Access-Control-Allow-Origin': '*', // permit all source or you can set a hostname
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token',
      });
    };
  };
}