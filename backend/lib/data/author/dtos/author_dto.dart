import 'package:backend/data/auth/dtos/user_dto.dart';
import 'package:drift/drift.dart';
import '../../../core/database/database.dart';
import '../../../core/rest_client/api_server.dart';
import '../../../domain/author_entity.dart';
import '../../organization/dtos/organization_dto.dart';

AuthorStatus _authorStatusFromJson(String status) {
  final normalized = status.trim();
  return switch (normalized) {
    'Студент' => AuthorStatus.student,
    'Преподаватель' => AuthorStatus.teacher,
    _ => throw ValidationException(message: 'Unknown status: $status'),
  };
}

EducationLevel _educationLevelFromJson(String educationLevel) {
  final normalized = educationLevel.trim();
  return switch (normalized) {
    'Бакалавриат' => EducationLevel.bachelor,
    'Специалитет' => EducationLevel.specialist,
    'Магистратура' => EducationLevel.master,
    'Аспирантура' => EducationLevel.postgraduate,
    _ => throw ValidationException(
      message: 'Unknown education level: $educationLevel',
    ),
  };
}

class AuthorDto {
  const AuthorDto({
    this.id,
    required this.user,
    required this.status,
    required this.lastNameRu,
    required this.lastNameEn,
    required this.firstNameRu,
    required this.firstNameEn,
    this.middleNameRu,
    this.middleNameEn,
    required this.organization,
    this.educationLevel,
    this.post,
    this.academicDegree,
    this.academicTitle,
  });
  final int? id;
  final UserDto user;
  final AuthorStatus status;
  final String lastNameRu;
  final String lastNameEn;
  final String firstNameRu;
  final String firstNameEn;
  final String? middleNameRu;
  final String? middleNameEn;
  final OrganizationDto organization;
  final EducationLevel? educationLevel;
  final String? post;
  final String? academicDegree;
  final String? academicTitle;

  AuthorEntity toEntity() => AuthorEntity(
    id: id,
    user: user.toEntity(),
    status: status,
    lastNameRu: lastNameRu,
    lastNameEn: lastNameEn,
    firstNameRu: firstNameRu,
    firstNameEn: firstNameEn,
    middleNameRu: middleNameRu,
    middleNameEn: middleNameEn,
    organization: organization.toEntity(),
    educationLevel: educationLevel,
    post: post,
    academicDegree: academicDegree,
    academicTitle: academicTitle,
  );

  AuthorsCompanion toCompanion() => AuthorsCompanion(
    uid: Value(user.uid),
    lastNameRu: Value(lastNameRu),
    lastNameEn: Value(lastNameEn),
    firstNameRu: Value(firstNameRu),
    firstNameEn: Value(firstNameEn),
    middleNameRu: Value(middleNameRu),
    middleNameEn: Value(middleNameEn),
    organizationId: Value(organization.id),
    educationLevel: Value(educationLevel?.value),
    post: Value(post),
    academicDegree: Value(academicDegree),
    academicTitle: Value(academicTitle),
  );

  factory AuthorDto.fromEntity(AuthorEntity author) => AuthorDto(
    id: author.id,
    user: UserDto.fromEntity(author.user),
    status: author.status,
    lastNameRu: author.lastNameRu,
    lastNameEn: author.lastNameEn,
    firstNameRu: author.firstNameRu,
    firstNameEn: author.firstNameEn,
    middleNameRu: author.middleNameRu,
    middleNameEn: author.middleNameEn,
    organization: OrganizationDto.fromEntity(author.organization),
    educationLevel: author.educationLevel,
    post: author.post,
    academicDegree: author.academicDegree,
    academicTitle: author.academicTitle,
  );

  factory AuthorDto.fromJson(Map<String, Object?> json) {
    try {
      return AuthorDto(
        id: json['id'] as int?,
        user: UserDto.fromJson(json['user'] as Map<String, Object?>),
        status: _authorStatusFromJson(json['status'] as String),
        lastNameRu: json['last_name_ru'] as String,
        lastNameEn: json['last_name_en'] as String,
        firstNameRu: json['first_name_ru'] as String,
        firstNameEn: json['first_name_en'] as String,
        middleNameRu: json['middle_name_ru'] as String?,
        middleNameEn: json['middle_name_en'] as String?,
        organization: OrganizationDto.fromJson(
          json['organization'] as Map<String, Object?>,
        ),
        educationLevel: json['educationLevel'] != null
            ? _educationLevelFromJson(json['education_level'] as String)
            : null,
        post: json['post'] as String?,
        academicDegree: json['academic_degree'] as String?,
        academicTitle: json['academic_degree'] as String?,
      );
    } catch (e) {
      throw JsonDeserializationException(
        message: 'Error when deserializing AuthorDtoCreated from JSON',
        cause: e,
      );
    }
  }
}
