import 'dart:async';
import 'dart:io' as io;
import 'package:backend/app/app.dart';
import 'package:backend/router/router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

void main([List<String>? args]) async {
  final logger = LoggerSettings.initLogger();
  final composition = await composeDependencies(logger: logger);
  final di = composition.dependencies;

  runZonedGuarded<Future<void>>(
    () async {
      final handler = Cascade()
          .add(composition.dependencies.userController.handler)
          .add(composition.dependencies.authorController.handler)
          .handler;

      final pipeline = Pipeline()
          .addMiddleware(corsHeaders())
          .addMiddleware(logRequests())
          .addMiddleware(
            AuthenticationCheckMiddleware.createAuthenticationCheckMiddleware(
              firebaseAdminSDKApp: di.firebaseAdminSDKApp,
              logger: di.logger,
            ),
          )
          .addHandler(handler);

      di.logger.info('Server is ready to start');

      await serve(
        pipeline,
        io.InternetAddress.anyIPv4,
        int.parse(di.config.port),
      );
    },
    (error, stackTrace) {
      di.logger.severe(error, error, stackTrace);
      io.exit(2);
    },
  );
}
