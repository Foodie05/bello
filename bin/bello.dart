/*
* This is bello on server side
* */
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import './global/value.dart';
import './global/cors.dart';
import './router_func/visit_count.dart';
import './router_func/download.dart';
import './router_func/picture_proxy.dart';
import './router_func/account/admin_register.dart';
import './router_func/account/login.dart';
import './router_func/account/login_twice.dart';
import './router_func/account/register.dart';
import './router_func/account/admin_account_mgr.dart';
import './global/func.dart';
import './router_func/article/get_article.dart';
import './router_func/debug_count.dart';

void main(List<String> arguments) async{
  print('bello version:$belloVersion, version number:$belloVersionNumber');
  print('initializing environment...');
  bool initResult=await initDirAndFile();
  if(initResult==false){
    print('Program exits because of errors');
    return;
  }else{
    print('Init succeeded');
  }
  final router=Router();//definite a router
  // CORS Request Handle
  router.options('/<ignored|.*>', (Request request) => Response.ok(''));

  //Real handle

  //visit count
  router.post('/visits', updateVisits);
  router.get('/visits', getVisits);
  router.post('/debug', updateDebugVisits);
  router.get('/debug', getDebugVisits);

  //file download
  router.get('/download/<fileName>',downloadHandler);

  //picture proxy
  router.get('/pic/<url>',pictureProxy);

  //account
  router.post('/register',accountRegister);
  router.post('/admin/register', adminRegister);
  router.post('/login_twice', loginTwice);
  router.post('/login', login);

  //article
  router.post('/article', getArticle);

  // Add Middleware and launch the server
  final handler = Pipeline()
      .addMiddleware(logRequests())  // take log
      .addMiddleware(corsHeaders())  // add CORS middleware
      .addHandler(router.call);

  // load ssl and private key
  final securityContext = SecurityContext()
    ..useCertificateChain(webCertificateChain)
    ..usePrivateKey(webCertificatePrivateKey);

  // launch server on port
  final server = await HttpServer.bindSecure(
    webAddress,  // listen the address
    webPort,     // HTTPS port
    securityContext,
  );

  // bind shelf handler to HttpServer
  server.listen((HttpRequest request) {
    // Check if it's a WebSocket request (by checking if it's an upgrade request)
    if (request.uri.path=='/admin/account_mgr'&&WebSocketTransformer.isUpgradeRequest(request)) {
      adminAccountMgr(request);
    } else {
      // Handle HTTP request with Shelf router if it's not a WebSocket request
      io.handleRequest(request, handler);
    }
  });

  print('HTTPS Server listening on port ${server.port}');
}
