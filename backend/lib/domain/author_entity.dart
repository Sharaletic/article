import 'package:backend/domain/user_entity.dart';

class AuthorEntity {
  const factory AuthorEntity.created({required UserEntity user}) =
      AuthorEntityCreated;

  const factory AuthorEntity.full({required int id, required String uid}) =
      AuthorEntityFull;
}

class AuthorEntityCreated implements AuthorEntity {
  const AuthorEntityCreated({required this.user});
  final UserEntity user;
}

class AuthorEntityFull implements AuthorEntity {
  const AuthorEntityFull({required this.id, required this.uid});
  final int id;
  final String uid;
}
