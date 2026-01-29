import 'package:backend/data/dtos/user_dto.dart';
import 'package:backend/domain/user_entity.dart';
import 'package:drift/drift.dart';
import '../../database/database.dart';
import '../../domain/author_entity.dart';

class AuthorDto {
  const factory AuthorDto.created({required UserEntity user}) =
      AuthorDtoCreated;

  const factory AuthorDto.full({required int id, required String uid}) =
      AuthorDtoFull;
}

class AuthorDtoCreated implements AuthorDto {
  const AuthorDtoCreated({required this.user});
  final UserEntity user;

  AuthorEntityCreated toEntity() => AuthorEntityCreated(user: user);

  AuthorsCompanion toCompanion() => AuthorsCompanion(uid: Value(user.uid));

  factory AuthorDtoCreated.fromEntity(AuthorEntityCreated author) =>
      AuthorDtoCreated(user: author.user);

  factory AuthorDtoCreated.fromJson(Map<String, Object> json) =>
      AuthorDtoCreated(
        user: UserDto.fromJson(json['user'] as Map<String, Object>).toEntity(),
      );
}

class AuthorDtoFull implements AuthorDto {
  const AuthorDtoFull({required this.id, required this.uid});
  final int id;
  final String uid;

  Map<String, dynamic> toJson() => {'id': id, 'uid': uid};

  AuthorsCompanion toCompanion() => AuthorsCompanion(uid: Value(uid));

  factory AuthorDtoFull.fromJson(Map<String, Object> json) =>
      AuthorDtoFull(id: json['id'] as int, uid: json['uid'] as String);

  factory AuthorDtoFull.fromDataBase(Author user) =>
      AuthorDtoFull(id: user.id, uid: user.uid);
}
