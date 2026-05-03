import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../conference.dart';
part 'conference_event.dart';
part 'conference_state.dart';

class ConferenceBloc extends Bloc<ConferenceEvent, ConferenceState> {
  ConferenceBloc({required IConferenceRepository conferenceRepository})
    : _conferenceRepository = conferenceRepository,
      super(const .noSearched()) {
    final onTextChanged = PublishSubject<String>();
    onTextChanged
        .distinct()
        .debounceTime(const Duration(milliseconds: 250))
        .listen((String query) => add(.search(query: query)));

    on<ConferenceEvent>((event, emit) async {
      await event.map(search: (event) => _search(event.query, emit));
    }, transformer: droppable());

    this.onTextChanged = onTextChanged;
  }
  late Sink<String> onTextChanged;
  final IConferenceRepository _conferenceRepository;

  Future<void> _search(String query, Emitter<ConferenceState> emit) async {
    try {
      emit(const .loading());
      if (query.isEmpty) {
        emit(const .noSearched());
      } else {
        final conferences = await _conferenceRepository.searchConferences(
          query: query,
        );
        if (conferences == null) {
          emit(.notFound());
        } else {
          emit(.loaded(conferences: conferences));
        }
      }
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        .error(
          message: 'Произошла ошибка, попробуйте позже',
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
