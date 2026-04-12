import 'package:firebase_admin/firebase_admin.dart';
import '../core/rest_client/api_server.dart';

abstract interface class IClaimsService {
  Future<void> setUserRole({required String uid, required String role});
}

class ClaimsService implements IClaimsService {
  ClaimsService({required App firebaseAdminSDKApp})
    : _firebaseAdminSDKApp = firebaseAdminSDKApp;
  final App _firebaseAdminSDKApp;

  @override
  Future<void> setUserRole({required String uid, required String role}) async {
    try {
      await _firebaseAdminSDKApp.auth().setCustomUserClaims(uid, {
        'role': role,
      });
    } on FirebaseAuthError catch (error) {
      throw firebaseAuthErrorToApiServerException(error);
    } on Exception catch (error) {
      throw BadRequestException(
        message: 'Unexpected error while setting user role',
        cause: error,
      );
    }
  }
}
