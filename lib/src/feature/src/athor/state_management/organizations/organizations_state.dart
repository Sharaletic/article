part of 'organizations_bloc.dart';

typedef OrganizationsStateMatch<R, S extends OrganizationsState> =
    R Function(S state);

sealed class OrganizationsState {
  const OrganizationsState();

  const factory OrganizationsState.loading() = _LoadingOrganizationsState;

  const factory OrganizationsState.loaded({
    required List<OrganizationEntity>? organizations,
  }) = _LoadedOrganizationsState;

  const factory OrganizationsState.error({
    required Object error,
    StackTrace? stackTrace,
  }) = _ErrorOrganizationsState;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required OrganizationsStateMatch<R, _LoadingOrganizationsState> loading,
    // ignore: library_private_types_in_public_api
    required OrganizationsStateMatch<R, _LoadedOrganizationsState> loaded,
    // ignore: library_private_types_in_public_api
    required OrganizationsStateMatch<R, _ErrorOrganizationsState> error,
  }) {
    return switch (this) {
      _LoadingOrganizationsState s => loading(s),
      _LoadedOrganizationsState s => loaded(s),
      _ErrorOrganizationsState s => error(s),
    };
  }

  R maybeMap<R>({
    required R Function() orElse,
    // ignore: library_private_types_in_public_api
    OrganizationsStateMatch<R, _LoadingOrganizationsState>? loading,
    // ignore: library_private_types_in_public_api
    OrganizationsStateMatch<R, _LoadedOrganizationsState>? loaded,
    // ignore: library_private_types_in_public_api
    OrganizationsStateMatch<R, _ErrorOrganizationsState>? error,
  }) {
    return map<R>(
      loading: loading ?? (_) => orElse(),
      loaded: loaded ?? (_) => orElse(),
      error: error ?? (_) => orElse(),
    );
  }

  R? mapOrNull<R>({
    // ignore: library_private_types_in_public_api
    OrganizationsStateMatch<R, _LoadingOrganizationsState>? loading,
    // ignore: library_private_types_in_public_api
    OrganizationsStateMatch<R, _LoadedOrganizationsState>? loaded,
    // ignore: library_private_types_in_public_api
    OrganizationsStateMatch<R, _ErrorOrganizationsState>? error,
  }) {
    return map<R?>(
      loading: loading ?? (_) => null,
      loaded: loaded ?? (_) => null,
      error: error ?? (_) => null,
    );
  }
}

final class _LoadingOrganizationsState extends OrganizationsState {
  const _LoadingOrganizationsState();
}

final class _LoadedOrganizationsState extends OrganizationsState {
  const _LoadedOrganizationsState({required this.organizations});
  final List<OrganizationEntity>? organizations;
}

final class _ErrorOrganizationsState extends OrganizationsState {
  const _ErrorOrganizationsState({required this.error, this.stackTrace});
  final Object error;
  final Object? stackTrace;
}
