import '../../authentication.dart';

abstract interface class IAuthenticationRepository {
  Future<UserEntity> signup({
    required String emailAddress,
    required String password,
  });

  Future<UserEntity> login({
    required String emailAddress,
    required String password,
  });

  Future<UserEntity> updateDisplayName({required String name});

  Future<void> logout();
}
