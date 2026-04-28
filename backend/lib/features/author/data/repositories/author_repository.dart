import '../../../../auth/claims_service.dart';
import '../../../../core/database/database.dart';
import '../../../auth/auth.dart';
import '../../author.dart';

abstract interface class IAuthorRepository {
  Future<void> createAuthor({required AuthorEntity author});
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
  Future<void> createAuthor({required AuthorEntity author}) async {
    await _appDatabase.transaction(() async {
      await _appDatabase
          .into(_appDatabase.user)
          .insert(UserDto.fromEntity(author.user).toCompanion());

      await _claimsService.setUserRole(
        uid: author.user.uid,
        role: author.user.role.value,
      );

      await _appDatabase
          .into(_appDatabase.author)
          .insert(AuthorDto.fromEntity(author).toCompanion());
    });
  }
}
