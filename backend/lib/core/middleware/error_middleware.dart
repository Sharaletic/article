import 'package:backend/app/app.dart';
import 'package:logger/logger.dart';
import 'package:shelf/shelf.dart';
import '../rest_client/api_server.dart';

abstract class ErrorMiddleware {
  static Middleware createErrorMiddleware({
    required Logger logger,
    required ApiServer apiServer,
  }) {
    return createMiddleware(
      errorHandler: (error, stackTrace) {
        logger.severe('Error middleware failed', error, stackTrace);

        return switch (error) {
          ApiServerException ex => apiServer.sendResponse(
            ex.statusCode,
            body: ex.bodyToJson(),
          ),
          _ => apiServer.sendResponse(500, body: {'error': error}),
        };
      },
    );
  }
}
