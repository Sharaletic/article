import '../../../auth/claims_service.dart';
import '../../../core/database/database.dart';
import '../../../domain/author_entity.dart';
import '../../data.dart';

abstract interface class IAuthorRepository {
  Future<void> createAuthor({required AuthorEntityCreated author});
}

class AuthorRepositoryImpl implements IAuthorRepository {
  AuthorRepositoryImpl({
    required AppDatabase appDatabase,
    required IClaimsService claimsService,
  }) : _appDatabase = appDatabase,
       _claimsService = claimsService;
  final AppDatabase _appDatabase;
  final IClaimsService _claimsService;

  @override
  Future<void> createAuthor({required AuthorEntityCreated author}) async {
    await _appDatabase.transaction(() async {
      await _appDatabase
          .into(_appDatabase.users)
          .insert(UserDto.fromEntity(author.user).toCompanion());

      await _claimsService.setUserRole(
        uid: author.user.uid,
        role: author.role.value,
      );

      await _appDatabase
          .into(_appDatabase.authors)
          .insert(AuthorDtoCreated.fromEntity(author).toCompanion());
    });
  }
}
