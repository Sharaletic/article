part of 'author_form_cubit.dart';

class AuthorFormState {
  const AuthorFormState({
    this.status = .student,
    this.lastNameRu = '',
    this.lastNameEn = '',
    this.firstNameRu = '',
    this.firstNameEn = '',
    this.middleNameRu,
    this.middleNameEn,
    this.organization,
    this.educationLevel,
    this.posts,
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
  final List<Post>? posts;
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
      (posts != null && posts!.isNotEmpty) &&
      academicDegree != null &&
      academicTitle != null;

  bool get canStudentSubmit =>
      status == .student && isValidForStudent && !isSubmitting;

  bool get canTeacherSubmit =>
      status == .teacher && isValidForTeacher && !isSubmitting;

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
    List<Post>? posts,
    AcademicDegree? academicDegree,
    AcademicTitle? academicTitle,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return AuthorFormState(
      status: status ?? this.status,
      lastNameRu: lastNameRu ?? this.lastNameRu,
      lastNameEn: lastNameEn ?? this.lastNameEn,
      firstNameRu: firstNameRu ?? this.firstNameRu,
      firstNameEn: firstNameEn ?? this.firstNameEn,
      middleNameRu: middleNameRu ?? this.middleNameRu,
      middleNameEn: middleNameEn ?? this.middleNameEn,
      organization: organization ?? this.organization,
      educationLevel: educationLevel ?? this.educationLevel,
      posts: posts ?? this.posts,
      academicDegree: academicDegree ?? this.academicDegree,
      academicTitle: academicTitle ?? this.academicTitle,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
