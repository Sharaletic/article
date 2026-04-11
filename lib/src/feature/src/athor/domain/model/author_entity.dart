import '../../../../../app/app.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

enum AuthorStatus {
  student('Студент'),
  teacher('Преподаватель');

  const AuthorStatus(this.value);
  final String value;
}

enum EducationLevel {
  bachelor('Бакалавриат'),
  specialist('Специалитет'),
  master('Магистратура'),
  postgraduate('Аспирантура');

  const EducationLevel(this.value);
  final String value;
}

enum Post {
  student('Студент'),
  teacher('Преподаватель');

  const Post(this.value);
  final String value;
}

enum AcademicDegree {
  student('Студент'),
  teacher('Преподаватель');

  const AcademicDegree(this.value);
  final String value;
}

enum AcademicTitle {
  student('Студент'),
  teacher('Преподаватель');

  const AcademicTitle(this.value);
  final String value;
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
  final AuthenticatedUser user;
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
  String toString() =>
      '''_AthorEntityCreated(
      id: $id,
      user: ${user.toString()},
      status: $status,
      lastNameRu: $lastNameRu,
      lastNameEn: $lastNameEn,
      firstNameRu: $firstNameRu,
      firstNameEn: $firstNameEn,
      middleNameRu: $middleNameRu,
      middleNameEn: $middleNameEn,
      organization: $organization,
      educationLevel: $educationLevel,
      post: $posts,
      academicDegree: $academicDegree,
      academicTitle: $academicTitle)''';

  @override
  List<Object?> get fields => [
    id,
    user,
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
