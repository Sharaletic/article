import 'package:arcticle_app/feature/src/authentication/domain/model/user_entity.dart';

abstract interface class IAuthenticationRepository {
  Future<UserEntity> signup({
    required String emailAddress,
    required String password,
  });

  Future<void> createUser({
    required String emailAddress,
    required String password,
  });

  Future<UserEntity> login({
    required String emailAddress,
    required String password,
  });
  Future<void> logout();
}
