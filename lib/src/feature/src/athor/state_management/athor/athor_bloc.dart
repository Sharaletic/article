import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

part 'athor_event.dart';
part 'athor_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AthorState> {
  AuthorBloc({required IAuthorRepository authorRepository})
    : _authorRepository = authorRepository,
      super(AthorState.initial(isEnabled: false)) {
    on<AuthorEvent>((event, emit) async {
      await event.map(createAuthor: (e) => _createAuthor(e, emit));
    }, transformer: droppable());
  }

  final IAuthorRepository _authorRepository;

  Future<void> _createAuthor(
    CreateAuthorEvent event,
    Emitter<AthorState> emit,
  ) async {
    try {
      if (event.status == AuthorStatus.student) {
        if (event.lastNameRu != null &&
            event.lastNameEn != null &&
            event.firstNameRu != null &&
            event.firstNameEn != null &&
            event.organization != null &&
            event.educationLevel != null) {
          await _authorRepository.createAthor(
            author: AuthorEntity(
              user: event.user,
              status: event.status,
              lastNameRu: event.lastNameRu!,
              lastNameEn: event.lastNameEn!,
              firstNameRu: event.firstNameRu!,
              firstNameEn: event.firstNameEn!,
              middleNameRu: event.middleNameRu,
              middleNameEn: event.middleNameEn,
              organization: event.organization!,
              educationLevel: event.educationLevel!,
            ),
          );
          emit(const AthorState.createdAthor(isEnabled: true));
        }
      } else if (event.status == AuthorStatus.teacher) {
        if (event.lastNameRu != null &&
            event.lastNameEn != null &&
            event.firstNameRu != null &&
            event.firstNameEn != null &&
            event.organization != null &&
            event.post != null &&
            event.academicDegree != null &&
            event.academicTitle != null) {
          await _authorRepository.createAthor(
            author: AuthorEntity(
              user: event.user,
              status: event.status,
              lastNameRu: event.lastNameRu!,
              lastNameEn: event.lastNameEn!,
              firstNameRu: event.firstNameRu!,
              firstNameEn: event.firstNameEn!,
              middleNameRu: event.middleNameRu,
              middleNameEn: event.middleNameEn,
              organization: event.organization!,
              post: event.post!,
              academicDegree: event.academicDegree!,
              academicTitle: event.academicTitle!,
            ),
          );
          emit(const AthorState.createdAthor(isEnabled: true));
        }
      }
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        AthorState.error(
          isEnabled: false,
          error: error,
          stackTrace: stackTrace,
        ),
      );
      rethrow;
    }
  }
}
