import 'package:firebase_admin/firebase_admin.dart';

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
      await _firebaseAdminSDKApp.auth().setCustomUserClaims(uid, {role: role});
    } on Exception catch (e) {
      // TODO
    }
  }
}
