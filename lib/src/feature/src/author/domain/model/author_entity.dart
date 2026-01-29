import '../../../../../app/app.dart';
import '../../../authentication/authentication.dart';

class AuthorEntity {
  const factory AuthorEntity.created({
    required int id,
    required AuthenticatedUser user,
  }) = AuthorEntityCreated;

  const factory AuthorEntity.full({
    required int id,
    required String emailAddress,
    required String displayName,
    required String photoUrl,
  }) = AuthorEntityFull;
}

class AuthorEntityCreated with EqualsMixin implements AuthorEntity {
  const AuthorEntityCreated({required this.id, required this.user});
  final int id;
  final AuthenticatedUser user;

  @override
  String toString() => '_AuthorEntityCreated(user: ${user.toString()})';

  @override
  List<Object?> get fields => [user];
}

class AuthorEntityFull with EqualsMixin implements AuthorEntity {
  const AuthorEntityFull({
    required this.id,
    required this.emailAddress,
    required this.displayName,
    required this.photoUrl,
  });
  final int id;
  final String emailAddress;
  final String displayName;
  final String photoUrl;

  @override
  List<Object?> get fields => [id, emailAddress, displayName, photoUrl];
}
