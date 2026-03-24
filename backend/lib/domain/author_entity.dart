import 'organization_entity.dart';
import 'user_entity.dart';

enum EducationLevel {
  bachelor('Бакалавриат'),
  specialist('Специалитет'),
  master('Магистратура'),
  postgraduate('Аспирантура');

  const EducationLevel(this.value);
  final String value;
}

enum AuthorStatus {
  student('Студент'),
  teacher('Преподаватель');

  const AuthorStatus(this.value);
  final String value;
}

class AuthorEntity {
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
    this.post,
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
  final String? post;
  final String? academicDegree;
  final String? academicTitle;
}
