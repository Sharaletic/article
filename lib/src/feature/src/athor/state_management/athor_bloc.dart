import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../author.dart';

part 'athor_event.dart';
part 'athor_state.dart';

class AthorBloc extends Bloc<AthorEvent, AthorState> {
  AthorBloc({required IAuthorRepository authorRepository})
    : _authorRepository = authorRepository,
      super(AthorState.initial()) {
    on<AthorEvent>((event, emit) async {
      await event.map(createAuthor: (e) => _createAuthor(e, emit));
    }, transformer: droppable());
  }

  final IAuthorRepository _authorRepository;

  Future<void> _createAuthor(
    CreateAuthorEvent event,
    Emitter<AthorState> emit,
  ) async {
    try {
      await _authorRepository.createAuthor(author: event.author);
      emit(AthorState.createdAthor());
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(AthorState.error(message: 'Ошибка создания автора'));
    }
  }
}
