import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../author.dart';
part 'author_form_state.dart';

class AuthorFormCubit extends Cubit<AuthorFormState> {
  AuthorFormCubit({required AuthorBloc authorBloc})
    : _authorBloc = authorBloc,
      super(AuthorFormState());

  final AuthorBloc _authorBloc;

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
  void postChanged(Post? value) => emit(state.copyWith(post: value));
  void academicDegree(AcademicDegree? value) =>
      emit(state.copyWith(academicDegree: value));
  void academicTitle(AcademicTitle? value) =>
      emit(state.copyWith(academicTitle: value));

  Future<void> submit({required AuthorEntity author}) async {
    try {
      if (state.isValidForStudent || state.isValidForTeacher) {
        emit(state.copyWith(isSubmitting: true));
        _authorBloc.add(AuthorEvent.createAuthor(author: author));
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      }
    } on Object catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
      rethrow;
    }
  }
}
