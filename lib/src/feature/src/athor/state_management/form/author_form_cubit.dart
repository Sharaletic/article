import 'package:flutter_bloc/flutter_bloc.dart';
import '../../author.dart';
part 'author_form_state.dart';

class AuthorFormCubit extends Cubit<AuthorFormState> {
  AuthorFormCubit() : super(AuthorFormState());

  void statusChanged(AuthorStatus? value) =>
      emit(state.copyWith(status: value));
  void lastNameRuChanged(String? value) =>
      emit(state.copyWith(lastNameRu: value));
  void lastNameEnChanged(String? value) =>
      emit(state.copyWith(lastNameEn: value));
  void firstNameRuChanged(String? value) =>
      emit(state.copyWith(firstNameRu: value));
  void firstNameEnChanged(String? value) =>
      emit(state.copyWith(firstNameEn: value));
  void middleNameRuChanged(String? value) =>
      emit(state.copyWith(middleNameRu: value));
  void middleNameEnChanged(String? value) =>
      emit(state.copyWith(middleNameEn: value));
  void organizationChanged(OrganizationEntity? value) =>
      emit(state.copyWith(organization: value));
  void educationLevelChanged(EducationLevel? value) =>
      emit(state.copyWith(educationLevel: value));
  void postChangedByAdd(Post? value) {
    final posts = List<Post>.from(state.posts ?? []);
    posts.add(value!);
    emit(state.copyWith(posts: posts));
  }

  void postChanged(List<Post>? value) => emit(state.copyWith(posts: value));
  void postChangedByRemove(Post value) =>
      emit(state.copyWith(posts: state.posts?..remove(value)));
  void academicDegree(AcademicDegree? value) =>
      emit(state.copyWith(academicDegree: value));
  void academicTitle(AcademicTitle? value) =>
      emit(state.copyWith(academicTitle: value));

  void setSubmiting({required bool isSubmitting}) =>
      emit(state.copyWith(isSubmitting: isSubmitting));

  void setSuccess() =>
      emit(state.copyWith(isSubmitting: false, isSuccess: true));

  void setError(String message) =>
      emit(state.copyWith(isSubmitting: false, errorMessage: message));
}
