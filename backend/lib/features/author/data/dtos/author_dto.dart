import 'dart:convert';
import 'package:backend/features/auth/data/dtos/user_dto.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/database.dart';
import '../../../../core/rest_client/api_server.dart';
import '../../domain/author_entity.dart';
import 'organization_dto.dart';

AuthorStatus _authorStatusFromJson(String status) {
  final normalized = status.trim();
  return switch (normalized) {
    'Студент' => AuthorStatus.student,
    'Преподаватель' => AuthorStatus.teacher,
    _ => throw ValidationException(message: 'Unknown status: $status'),
  };
}

EducationLevel? _educationLevelFromJson(String? educationLevel) {
  if (educationLevel == null || educationLevel.isEmpty) return null;

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

AcademicDegree? _academicDegreeFromJson(String? academicDegree) {
  if (academicDegree == null || academicDegree.isEmpty) return null;

  final normalized = academicDegree.trim();
  return switch (normalized) {
    'Студент' => AcademicDegree.student,
    'Преподаватель' => AcademicDegree.teacher,
    _ => throw ValidationException(
      message: 'Unknown academic degree: $academicDegree',
    ),
  };
}

AcademicTitle? _academicTitleFromJson(String? academicTitle) {
  if (academicTitle == null || academicTitle.isEmpty) return null;

  final normalized = academicTitle.trim();
  return switch (normalized) {
    'Студент' => AcademicTitle.student,
    'Преподаватель' => AcademicTitle.teacher,
    _ => throw ValidationException(
      message: 'Unknown academic title: $academicTitle',
    ),
  };
}

class PostConverter extends TypeConverter<List<Post>?, String?> {
  const PostConverter();

  @override
  List<Post>? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;
    final list = jsonDecode(fromDb) as List<Object>;
    return list.map((post) => _parsePost(post as String?)).toList();
  }

  @override
  String? toSql(List<Post>? value) {
    if (value == null || value.isEmpty) return null;
    return jsonEncode(value.map((e) => e.name).toList());
  }

  List<Post>? fromJson(List<dynamic>? json) {
    if (json == null || json.isEmpty) return null;
    return json
        .where((e) => e != null && e.isNotEmpty)
        .map((e) => _parsePost(e as String))
        .toList();
  }

  Post _parsePost(String? value) {
    final post = value?.trim();
    return switch (post) {
      'Студент' => Post.student,
      'Преподаватель' => Post.teacher,
      _ => throw ValidationException(message: 'Unknown post: $post'),
    };
  }

  List<String>? toJson(List<Post>? posts) {
    if (posts == null || posts.isEmpty) return null;
    return posts.map((e) => e.name).toList();
  }
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
    this.posts,
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
  final List<Post>? posts;
  final AcademicDegree? academicDegree;
  final AcademicTitle? academicTitle;

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
    posts: posts,
    academicDegree: academicDegree,
    academicTitle: academicTitle,
  );

  AuthorCompanion toCompanion() => AuthorCompanion(
    uid: Value(user.uid),
    status: Value(status.value),
    lastNameRu: Value(lastNameRu),
    lastNameEn: Value(lastNameEn),
    firstNameRu: Value(firstNameRu),
    firstNameEn: Value(firstNameEn),
    middleNameRu: Value(middleNameRu),
    middleNameEn: Value(middleNameEn),
    organizationId: Value(organization.id),
    educationLevel: Value(educationLevel?.value),
    posts: Value(posts),
    academicDegree: Value(academicDegree?.value),
    academicTitle: Value(academicTitle?.value),
  );

  factory AuthorDto.fromEntity(AuthorEntity entity) => AuthorDto(
    id: entity.id,
    user: UserDto.fromEntity(entity.user),
    status: entity.status,
    lastNameRu: entity.lastNameRu,
    lastNameEn: entity.lastNameEn,
    firstNameRu: entity.firstNameRu,
    firstNameEn: entity.firstNameEn,
    middleNameRu: entity.middleNameRu,
    middleNameEn: entity.middleNameEn,
    organization: OrganizationDto.fromEntity(entity.organization),
    educationLevel: entity.educationLevel,
    posts: entity.posts,
    academicDegree: entity.academicDegree,
    academicTitle: entity.academicTitle,
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
        educationLevel: _educationLevelFromJson(
          json['education_level'] as String?,
        ),
        posts: PostConverter().fromJson(json['posts'] as List<dynamic>?),
        academicDegree: _academicDegreeFromJson(
          json['academic_degree'] as String?,
        ),
        academicTitle: _academicTitleFromJson(
          json['academic_title'] as String?,
        ),
      );
    } catch (e) {
      throw JsonDeserializationException(
        message: 'Error when deserializing AuthorDtoCreated from JSON',
        cause: e,
      );
    }
  }

  Map<String, Object?> toJson() => {
    'id': id,
    'user': user.toJson(),
    'status': status.value,
    'last_name_ru': lastNameRu,
    'last_name_en': lastNameEn,
    'first_name_ru': firstNameRu,
    'first_name_en': firstNameEn,
    'middle_name_ru': middleNameRu,
    'middle_name_en': middleNameEn,
    'organization': organization.toJson(),
    'education_level': educationLevel?.value,
    'posts': PostConverter().toJson(posts),
    'academic_degree': academicDegree?.value,
    'academic_title': academicTitle?.value,
  };
}
