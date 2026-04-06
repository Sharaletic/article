part of 'organizations_bloc.dart';

typedef OrganizationsEventMatch<R, S extends OrganizationsEvent> =
    R Function(S event);

sealed class OrganizationsEvent {
  const OrganizationsEvent();

  const factory OrganizationsEvent.search({required String query}) =
      _SearchOrganizationsEvent;

  const factory OrganizationsEvent.load() = _LoadOrganizationsEvent;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required OrganizationsEventMatch<R, _SearchOrganizationsEvent> search,
    // ignore: library_private_types_in_public_api
    required OrganizationsEventMatch<R, _LoadOrganizationsEvent> load,
  }) {
    return switch (this) {
      _SearchOrganizationsEvent s => search(s),
      _LoadOrganizationsEvent s => load(s),
    };
  }
}

final class _LoadOrganizationsEvent extends OrganizationsEvent {
  const _LoadOrganizationsEvent();
}

final class _SearchOrganizationsEvent extends OrganizationsEvent {
  const _SearchOrganizationsEvent({required this.query});
  final String query;
}
