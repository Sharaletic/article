import '../../../app/app.dart';
import '../../../core/rest_client/api_server.dart';
import 'organization_entity.dart';
import '../../auth/domain/user_entity.dart';

enum EducationLevel {
  bachelor('Бакалавриат'),
  specialist('Специалитет'),
  master('Магистратура'),
  postgraduate('Аспирантура');

  const EducationLevel(this.value);
  final String value;

  static EducationLevel? fromString(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final normalized = value.trim().toLowerCase();

    return switch (normalized) {
      'бакалавриат' => .bachelor,
      'специалитет' => .specialist,
      'магистратура' => .master,
      'аспирантура' => .postgraduate,
      _ => throw ValidationException(
        message: 'Unknown education level: $value',
      ),
    };
  }
}

enum AuthorStatus {
  student('Студент'),
  teacher('Преподаватель');

  const AuthorStatus(this.value);
  final String value;

  static AuthorStatus fromString(String? value) {
    if (value == null || value.isEmpty) {
      throw ValidationException(message: 'Status cannot be null or empty');
    }
    final normalized = value.trim().toLowerCase();

    return switch (normalized) {
      'студент' => .student,
      'преподаватель' => .teacher,
      _ => throw ValidationException(message: 'Unknown status: $value'),
    };
  }
}

enum Post {
  student('Студент'),
  teacher('Преподаватель');

  const Post(this.value);
  final String value;

  static Post fromString(String? value) {
    if (value == null || value.isEmpty) {
      throw ValidationException(message: 'Post cannot be null or empty');
    }
    final normalized = value.trim().toLowerCase();

    return switch (normalized) {
      'студент' => .student,
      'преподаватель' => .teacher,
      _ => throw ValidationException(message: 'Unknown post: $value'),
    };
  }
}

enum AcademicDegree {
  student('Студент'),
  teacher('Преподаватель');

  const AcademicDegree(this.value);
  final String value;

  static AcademicDegree? fromString(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final normalized = value.trim().toLowerCase();

    return switch (normalized) {
      'студент' => .student,
      'преподаватель' => .teacher,
      _ => throw ValidationException(
        message: 'Unknown academic degree: $value',
      ),
    };
  }
}

enum AcademicTitle {
  student('Студент'),
  teacher('Преподаватель');

  const AcademicTitle(this.value);
  final String value;

  static AcademicTitle? fromString(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final normalized = value.trim().toLowerCase();

    return switch (normalized) {
      'студент' => .student,
      'преподаватель' => .teacher,
      _ => throw ValidationException(message: 'Unknown academic title: $value'),
    };
  }
}

class AuthorEntity with EqualsMixin {
  const AuthorEntity({
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
  final UserEntity user;
  final AuthorStatus status;
  final String lastNameRu;
  final String lastNameEn;
  final String firstNameRu;
  final String firstNameEn;
  final String? middleNameRu;
  final String? middleNameEn;
  final OrganizationEntity organization;
  final EducationLevel? educationLevel;
  final List<Post>? posts;
  final AcademicDegree? academicDegree;
  final AcademicTitle? academicTitle;

  @override
  List<Object?> get fields => [
    id,
    user,
    status,
    lastNameRu,
    lastNameEn,
    firstNameRu,
    firstNameEn,
    middleNameRu,
    middleNameEn,
    organization,
    educationLevel,
    posts,
    academicDegree,
    academicTitle,
  ];
}
