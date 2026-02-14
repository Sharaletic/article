import 'user_entity.dart';

class AuthorEntity {
  const factory AuthorEntity.created({
    required UserEntity user,
    UserRole role,
  }) = AuthorEntityCreated;

  const factory AuthorEntity.full({
    required int id,
    required String uid,
    required String emailAddress,
    required String displayName,
    String? photoUrl,
  }) = AuthorEntityFull;
}

class AuthorEntityCreated implements AuthorEntity {
  const AuthorEntityCreated({required this.user, this.role = UserRole.author});
  final UserEntity user;
  final UserRole role;
}

class AuthorEntityFull implements AuthorEntity {
  const AuthorEntityFull({
    required this.id,
    required this.uid,
    required this.emailAddress,
    required this.displayName,
    this.photoUrl,
  });
  final int id;
  final String uid;
  final String emailAddress;
  final String displayName;
  final String? photoUrl;
}
