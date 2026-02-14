import '../../../core/database/database.dart';
import '../dtos/user_dto.dart';

abstract interface class IUserRepository {
  Future<UserDto> createUser({required UserDto userDto});
}

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl({required AppDatabase appDatabase})
    : _appDatabase = appDatabase;
  final AppDatabase _appDatabase;

  @override
  Future<UserDto> createUser({required UserDto userDto}) async {
    final result = await _appDatabase
        .into(_appDatabase.users)
        .insertReturning(userDto.toCompanion());

    return UserDto.fromDataBase(result);
  }
}
