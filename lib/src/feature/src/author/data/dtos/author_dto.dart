import '../../../authentication/authentication.dart';
import '../../author.dart';

class AuthorDto {
  const factory AuthorDto.created({required AuthenticatedUser user}) =
      AuthorDtoCreated;

  const factory AuthorDto.full({
    required int id,
    required String emailAddress,
    required String displayName,
    required String photoUrl,
  }) = AuthorDtoFull;
}

class AuthorDtoCreated implements AuthorDto {
  const AuthorDtoCreated({this.details = 'details', required this.user});
  final String details;
  final AuthenticatedUser user;

  Map<String, dynamic> toJson() => {'user': UserDto.fromEntity(user).toJson()};

  //   Map<String, dynamic> toJson() => {
  //   'author': {'details': details},
  //   'user': UserDto.fromEntity(user).toJson(),
  // };
}

class AuthorDtoFull implements AuthorDto {
  const AuthorDtoFull({
    required this.id,
    required this.emailAddress,
    required this.displayName,
    required this.photoUrl,
  });
  final int id;
  final String emailAddress;
  final String displayName;
  final String photoUrl;

  AuthorEntity toDomain() => AuthorEntity.full(
    id: id,
    emailAddress: emailAddress,
    displayName: displayName,
    photoUrl: photoUrl,
  );
}
