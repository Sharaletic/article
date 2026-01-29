import '../../database/database.dart';
import '../../domain/author_entity.dart';
import '../data.dart';

abstract interface class AuthorRepository {
  Future<void> createAuthor({required AuthorEntityCreated author});
}

class AuthorRepositoryImpl implements AuthorRepository {
  AuthorRepositoryImpl({required AppDatabase appDatabase})
    : _appDatabase = appDatabase;
  final AppDatabase _appDatabase;

  @override
  Future<void> createAuthor({required AuthorEntityCreated author}) async {
    await _appDatabase
        .into(_appDatabase.users)
        .insert(UserDto.fromEntity(author.user).toCompanion());
    await _appDatabase
        .into(_appDatabase.authors)
        .insert(AuthorDtoCreated.fromEntity(author).toCompanion());
  }
}
