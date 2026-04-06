part of 'author_form_cubit.dart';

class AuthorFormState {
  const AuthorFormState({
    this.status = AuthorStatus.student,
    this.lastNameRu = '',
    this.lastNameEn = '',
    this.firstNameRu = '',
    this.firstNameEn = '',
    this.middleNameRu,
    this.middleNameEn,
    this.organization,
    this.educationLevel,
    this.post,
    this.academicDegree,
    this.academicTitle,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  final AuthorStatus status;
  final String lastNameRu;
  final String lastNameEn;
  final String firstNameRu;
  final String firstNameEn;
  final String? middleNameRu;
  final String? middleNameEn;
  final OrganizationEntity? organization;
  final EducationLevel? educationLevel;
  final Post? post;
  final AcademicDegree? academicDegree;
  final AcademicTitle? academicTitle;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  bool get isValidForStudent =>
      status.value.trim().isNotEmpty &&
      lastNameRu.trim().isNotEmpty &&
      lastNameEn.trim().isNotEmpty &&
      firstNameRu.trim().isNotEmpty &&
      firstNameEn.trim().isNotEmpty &&
      organization != null &&
      educationLevel != null;

  bool get isValidForTeacher =>
      status.value.trim().isNotEmpty &&
      lastNameRu.trim().isNotEmpty &&
      lastNameEn.trim().isNotEmpty &&
      firstNameRu.trim().isNotEmpty &&
      firstNameEn.trim().isNotEmpty &&
      organization != null &&
      post != null &&
      academicDegree != null &&
      academicTitle != null;

  bool get canSubmit =>
      (isValidForStudent || isValidForTeacher) && !isSubmitting;

  AuthorFormState copyWith({
    AuthorStatus? status,
    String? lastNameRu,
    String? lastNameEn,
    String? firstNameRu,
    String? firstNameEn,
    String? middleNameRu,
    String? middleNameEn,
    OrganizationEntity? organization,
    EducationLevel? educationLevel,
    Post? post,
    AcademicDegree? academicDegree,
    AcademicTitle? academicTitle,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) => AuthorFormState(
    status: status ?? this.status,
    lastNameRu: lastNameRu ?? this.lastNameRu,
    lastNameEn: lastNameEn ?? this.lastNameEn,
    firstNameRu: firstNameRu ?? this.firstNameRu,
    firstNameEn: firstNameEn ?? this.firstNameEn,
    middleNameRu: middleNameRu ?? this.middleNameRu,
    middleNameEn: middleNameEn ?? this.middleNameEn,
    organization: organization ?? this.organization,
    educationLevel: educationLevel ?? this.educationLevel,
    post: post ?? this.post,
    academicDegree: academicDegree ?? this.academicDegree,
    academicTitle: academicTitle ?? this.academicTitle,
    isSubmitting: isSubmitting ?? this.isSubmitting,
    isSuccess: isSuccess ?? this.isSuccess,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}
