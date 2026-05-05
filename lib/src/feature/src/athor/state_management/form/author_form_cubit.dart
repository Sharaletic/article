import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
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

  void addEmptyPost() => emit(
    state.copyWith(
      posts: state.posts == null
          ? [PostFieldState(null)]
          : [...state.posts!, PostFieldState(null)],
    ),
  );

  void removePost(int index) {
    if (index > 0) {
      final posts = List<PostFieldState>.from(state.posts!)..removeAt(index);
      emit(state.copyWith(posts: posts));
    }
  }

  void updatePost(Post? post, int index) {
    if (index < state.posts!.length && post != null) {
      final posts = List<PostFieldState>.from(state.posts!)
        ..[index] = PostFieldState(post);
      emit(state.copyWith(posts: posts));
    }
  }

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
