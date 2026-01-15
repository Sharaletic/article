import 'package:firebase_admin/firebase_admin.dart';
import 'package:logger/logger.dart';
import 'package:shelf/shelf.dart';
import '../../app/app.dart';

abstract class AuthenticationCheckMiddleware {
  static Middleware createAuthenticationCheckMiddleware({
    required App firebaseAdminSDKApp,
    required Logger logger,
  }) {
    return (Handler innerHandler) {
      return (Request request) async {
        try {
          logger.info('Checking the request ${request.requestedUri}');

          if (request.headers.containsKey('jwt_token')) {
            final token = request.headers['jwt_token'];
            if (token == null || token.isEmpty) {
              logger.severe('Token is invalid');
              return _getUnauthorizedResponse(request);
            }

            final idToken = await firebaseAdminSDKApp.auth().verifyIdToken(
              token,
            );

            if (idToken.isVerified != true) {
              logger.severe('Token is not valid / $token');
              return _getUnauthorizedResponse(request);
            }
          } else {
            return _getUnauthorizedResponse(request);
          }
        } catch (error) {
          return Response.badRequest();
        }

        return innerHandler(request);
      };
    };
  }

  static Response _getUnauthorizedResponse(Request request) =>
      Response.unauthorized('Request ${request.handlerPath} is not authorized');
}
