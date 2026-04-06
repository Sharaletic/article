import '../../../../../core/core.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

AuthorStatus _statusFromJson(String status) => switch (status) {
  'Студент' => AuthorStatus.student,
  'Преподаватель' => AuthorStatus.teacher,
  _ => throw StructuredBackendException(
    error: {'details': 'Invalid status $status received from server.'},
  ),
};

EducationLevel _educationLevelFromJson(String? educationLevel) =>
    switch (educationLevel) {
      'Бакалавриат' => EducationLevel.bachelor,
      'Специалитет' => EducationLevel.specialist,
      'Магистратура' => EducationLevel.master,
      'Аспирантура' => EducationLevel.postgraduate,
      _ => throw StructuredBackendException(
        error: {
          'details':
              'Invalid education level $educationLevel received from server.',
        },
      ),
    };

Post _postFromJson(String? post) => switch (post) {
  'Студент' => Post.student,
  'Преподаватель' => Post.teacher,
  _ => throw StructuredBackendException(
    error: {'details': 'Invalid post $post received from server.'},
  ),
};

AcademicDegree _academicDegreeFromJson(String? academicDegree) =>
    switch (academicDegree) {
      'Студент' => AcademicDegree.student,
      'Преподаватель' => AcademicDegree.teacher,
      _ => throw StructuredBackendException(
        error: {
          'details':
              'Invalid academic degree $academicDegree received from server.',
        },
      ),
    };

AcademicTitle _academicTitleFromJson(String? academicTitle) =>
    switch (academicTitle) {
      'Студент' => AcademicTitle.student,
      'Преподаватель' => AcademicTitle.teacher,
      _ => throw StructuredBackendException(
        error: {
          'details':
              'Invalid academic title $academicTitle received from server.',
        },
      ),
    };

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
    required this.educationLevel,
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
  final Post? post;
  final AcademicDegree? academicDegree;
  final AcademicTitle? academicTitle;

  factory AuthorDto.fromEntity({required AuthorEntity author}) => AuthorDto(
    id: author.id,
    user: UserDto.fromEntity(user: author.user),
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

  factory AuthorDto.fromJson({required Map<String, Object?> json}) => AuthorDto(
    id: json['id'] as int,
    user: UserDto.fromJson(json: json['user'] as Map<String, Object?>),
    status: _statusFromJson(json['status'] as String),
    lastNameRu: json['last_name_ru'] as String,
    lastNameEn: json['last_name_en'] as String,
    firstNameRu: json['first_name_ru'] as String,
    firstNameEn: json['first_name_en'] as String,
    middleNameRu: json['middle_name_ru'] as String?,
    middleNameEn: json['middle_name_en'] as String?,
    organization: OrganizationDto.fromJson(
      json['organization'] as Map<String, Object?>,
    ),
    educationLevel: _educationLevelFromJson(json['education_level'] as String?),
    post: _postFromJson(json['post'] as String?),
    academicDegree: _academicDegreeFromJson(json['academic_degree'] as String?),
    academicTitle: _academicTitleFromJson(json['academic_title'] as String?),
  );

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
    'post': post,
    'academic_degree': academicDegree,
    'academic_title': academicTitle,
  };
}
