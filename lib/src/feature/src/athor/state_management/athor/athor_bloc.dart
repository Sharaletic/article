import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../author.dart';

part 'athor_event.dart';
part 'athor_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  AuthorBloc({required IAuthorRepository authorRepository})
    : _authorRepository = authorRepository,
      super(AuthorState.initial()) {
    on<AuthorEvent>((event, emit) async {
      await event.map(createAuthor: (e) => _createAuthor(e, emit));
    }, transformer: droppable());
  }

  final IAuthorRepository _authorRepository;

  Future<void> _createAuthor(
    CreateAuthorEvent event,
    Emitter<AuthorState> emit,
  ) async {
    try {
      emit(const AuthorState.loading());
      await _authorRepository.createAthor(author: event.author);
      emit(const AuthorState.createdAthor());
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(AuthorState.error(error: error, stackTrace: stackTrace));
      rethrow;
    }
  }
}
