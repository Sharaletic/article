import '../../authentication.dart';

abstract interface class IAuthenticationRepository {
  Future<UserEntity> signup({
    required String emailAddress,
    required String password,
    required UserRole role,
  });

  Future<UserEntity> login({
    required String emailAddress,
    required String password,
  });
  Future<void> logout();
}
