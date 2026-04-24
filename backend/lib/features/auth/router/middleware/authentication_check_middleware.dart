import 'package:firebase_admin/firebase_admin.dart';
import 'package:logger/logger.dart';
import 'package:shelf/shelf.dart';
import '../../../../app/app.dart';
import '../../../../core/rest_client/api_server.dart';

abstract class AuthenticationCheckMiddleware {
  static Middleware createAuthenticationCheckMiddleware({
    required App firebaseAdminSDKApp,
    required ApiServer apiServer,
    required Logger logger,
  }) {
    return (Handler innerHandler) {
      return (Request request) async {
        try {
          logger.info('Checking the request ${request.requestedUri}');

          if (request.headers.containsKey('Authorization')) {
            final token = request.headers['Authorization'];
            if (token == null || token.isEmpty) {
              logger.severe('Token is invalid');
              return _getUnauthorizedResponse(request, apiServer);
            }

            final idToken = await firebaseAdminSDKApp.auth().verifyIdToken(
              token,
            );

            if (idToken.isVerified != true) {
              logger.severe('Token is invalid');
              return _getUnauthorizedResponse(request, apiServer);
            }
          } else {
            return _getUnauthorizedResponse(request, apiServer);
          }
        } on FirebaseAuthError catch (error, stackTrace) {
          logger.severe('Authentication middleware failed', error, stackTrace);
          return _getUnauthorizedResponse(request, apiServer);
        } catch (error, stackTrace) {
          logger.severe(
            'Unexpected error in authentication middleware',
            error,
            stackTrace,
          );
          return apiServer.sendResponse(
            500,
            body: {
              'error': {
                'code': 'INTERNAL_SERVER_ERROR',
                'message': 'An unexpected error occurred',
              },
            },
          );
        }
        return innerHandler(request);
      };
    };
  }

  static Response _getUnauthorizedResponse(
    Request request,
    ApiServer apiServer,
  ) => apiServer.sendResponse(
    401,
    body: {
      'error': {
        'code': 'AUTH_TOKEN_INVALID',
        'message': 'Invalid or missing authentication token',
      },
    },
  );
}
