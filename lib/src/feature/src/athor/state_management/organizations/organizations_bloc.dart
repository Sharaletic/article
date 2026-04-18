import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../author.dart';

part 'organizations_event.dart';
part 'organizations_state.dart';

class OrganizationsBloc extends Bloc<OrganizationsEvent, OrganizationsState> {
  OrganizationsBloc({required IOrganizationRepository organizationRepository})
    : _organizationRepository = organizationRepository,
      super(const .loading()) {
    final onTextChanged = PublishSubject<String>();
    onTextChanged
        .distinct()
        .debounceTime(const Duration(milliseconds: 250))
        .listen((String query) => add(.search(query: query)));

    on<OrganizationsEvent>((event, emit) async {
      await event.map(
        search: (event) => _search(event.query, emit),
        load: (event) async => {},
      );
    }, transformer: droppable());

    this.onTextChanged = onTextChanged;
  }

  late Sink<String> onTextChanged;
  final IOrganizationRepository _organizationRepository;

  Future<void> _search(String query, Emitter<OrganizationsState> emit) async {
    try {
      emit(const OrganizationsState.loading());
      final organizations = await _organizationRepository.searchOrganizations(
        query: query,
      );
      emit(OrganizationsState.loaded(organizations: organizations));
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        OrganizationsState.error(
          error: 'Произошла ошибка, попробуйте позже',
          stackTrace: stackTrace,
        ),
      );
      rethrow;
    }
  }
}
