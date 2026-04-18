import '../../authentication.dart';

abstract interface class IAuthenticationRepository {
  Future<void> signup({required String emailAddress, required String password});

  Future<void> login({required String emailAddress, required String password});

  Stream<UserEntity> getAuthState();

  Future<UserEntity> updateDisplayName({required String name});

  Future<void> logout();
}
