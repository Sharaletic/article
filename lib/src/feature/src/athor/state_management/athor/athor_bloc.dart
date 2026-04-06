import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../author.dart';

part 'athor_event.dart';
part 'athor_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AthorState> {
  AuthorBloc({required IAuthorRepository authorRepository})
    : _authorRepository = authorRepository,
      super(AthorState.initial()) {
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
      emit(const AthorState.loading());
      await _authorRepository.createAthor(author: event.author);
      emit(const AthorState.createdAthor());
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(AthorState.error(error: error, stackTrace: stackTrace));
      rethrow;
    }
  }
}
