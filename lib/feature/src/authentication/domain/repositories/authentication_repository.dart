import 'package:arcticle_app/feature/src/authentication/domain/model/user_entity.dart';

abstract interface class IAuthenticationRepository {
  Future<UserEntity> login(String email, String password);
  Future<void> logout();
}
