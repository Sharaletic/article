import '../../authentication.dart';

abstract interface class IAuthenticationRepository {
  Future<UserEntity> signup({
    required String emailAddress,
    required String password,
  });

  Future<void> createUser({required UserDto userDto, required String jwtToken});

  Future<UserEntity> login({
    required String emailAddress,
    required String password,
  });
  Future<void> logout();
}
