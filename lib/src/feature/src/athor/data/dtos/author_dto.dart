import '../../../authentication/authentication.dart';
import '../../author.dart';

class AuthorDto {
  const AuthorDto({
    required this.id,
    required this.user,
    required this.lastName,
    required this.firstName,
    this.middleName,
    required this.organization,
    this.educationLevel,
    this.post,
    this.academicDegree,
    this.academictitle,
  });
  final int id;
  final UserDto user;
  final String lastName;
  final String firstName;
  final String? middleName;
  final OrganizationDto organization;
  final String? educationLevel;
  final String? post;
  final String? academicDegree;
  final String? academictitle;

  factory AuthorDto.fromEntity({required AuthorEntity author}) => AuthorDto(
    id: author.id,
    user: UserDto.fromEntity(user: author.user),
    lastName: author.lastName,
    firstName: author.firstName,
    middleName: author.middleName,
    organization: OrganizationDto.fromEntity(entity: author.organization),
    educationLevel: author.educationLevel,
    post: author.post,
    academicDegree: author.academicDegree,
    academictitle: author.academictitle,
  );

  factory AuthorDto.fromJson({required Map<String, Object?> json}) => AuthorDto(
    id: json['id'] as int,
    user: UserDto.fromJson(json: json['user'] as Map<String, Object?>),
    lastName: json['lastName'] as String,
    firstName: json['firstName'] as String,
    middleName: json['middleName'] as String?,
    organization: OrganizationDto.fromJson(
      json: json['organization'] as Map<String, Object?>,
    ),
    educationLevel: json['educationLevel'] as String?,
    post: json['post'] as String?,
    academicDegree: json['academicDegree'] as String?,
    academictitle: json['academictitle'] as String?,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'user': user.toJson(),
    'lastName': lastName,
    'firstName': firstName,
    'middleName': middleName,
    'organization': organization.toJson(),
    'educationLevel': educationLevel,
    'post': post,
    'academicDegree': academicDegree,
    'academictitle': academictitle,
  };
}
