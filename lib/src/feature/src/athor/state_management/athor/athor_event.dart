part of 'athor_bloc.dart';

typedef AthorEventMatch<R, S extends AuthorEvent> = R Function(S event);

sealed class AuthorEvent {
  const AuthorEvent();

  const factory AuthorEvent.createAuthor({
    required AuthorStatus status,
    required AuthenticatedUser user,
    required String? lastNameRu,
    required String? lastNameEn,
    required String? firstNameRu,
    required String? firstNameEn,
    required String? middleNameRu,
    required String? middleNameEn,
    required OrganizationEntity? organization,
    EducationLevel? educationLevel,
    String? post,
    String? academicDegree,
    String? academicTitle,
  }) = CreateAuthorEvent;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required AthorEventMatch<R, CreateAuthorEvent> createAuthor,
  }) {
    return switch (this) {
      CreateAuthorEvent s => createAuthor(s),
    };
  }
}

final class CreateAuthorEvent extends AuthorEvent {
  const CreateAuthorEvent({
    required this.status,
    required this.user,
    required this.lastNameRu,
    required this.lastNameEn,
    required this.firstNameRu,
    required this.firstNameEn,
    required this.middleNameRu,
    required this.middleNameEn,
    required this.organization,
    this.educationLevel,
    this.post,
    this.academicDegree,
    this.academicTitle,
  });
  final AuthorStatus status;
  final AuthenticatedUser user;
  final String? lastNameRu;
  final String? lastNameEn;
  final String? firstNameRu;
  final String? firstNameEn;
  final String? middleNameRu;
  final String? middleNameEn;
  final OrganizationEntity? organization;
  final EducationLevel? educationLevel;
  final String? post;
  final String? academicDegree;
  final String? academicTitle;
}
