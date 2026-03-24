import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../author.dart';

part 'organizations_event.dart';
part 'organizations_state.dart';

class OrganizationsBloc extends Bloc<OrganizationsEvent, OrganizationsState> {
  OrganizationsBloc({
    required IOrganizationRepository organizationRepository,
    required Logger logger,
  }) : _organizationRepository = organizationRepository,
       _logger = logger,
       super(const .loading()) {
    on<OrganizationsEvent>((event, emit) async {
      await event.map(load: (event) => _load(event, emit));
    }, transformer: droppable());
  }

  final IOrganizationRepository _organizationRepository;
  final Logger _logger;

  Future<void> _load(
    _LoadOrganizationsEvent event,
    Emitter<OrganizationsState> emit,
  ) async {
    try {
      emit(const OrganizationsState.loading());
      final organizations = await _organizationRepository.getOrganizations();
      emit(OrganizationsState.loaded(organizations: organizations));
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      _logger.e(error);
      emit(OrganizationsState.error(error: error, stackTrace: stackTrace));
      rethrow;
    }
  }
}
