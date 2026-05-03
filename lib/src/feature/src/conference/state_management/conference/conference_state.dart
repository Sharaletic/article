part of 'conference_bloc.dart';

typedef ConferenceStateMatch<R, S extends ConferenceState> =
    R Function(S state);

sealed class ConferenceState {
  const ConferenceState();

  const factory ConferenceState.loading() = _LoadingConferenceState;

  const factory ConferenceState.noSearched() = _NoSearchedConferenceState;

  const factory ConferenceState.notFound() = _NotFoundConferenceState;

  const factory ConferenceState.loaded({
    required List<ConferenceEntity>? conferences,
  }) = _LoadedConferenceState;

  const factory ConferenceState.error({
    required String message,
    StackTrace? stackTrace,
  }) = _ErrorConferenceState;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required ConferenceStateMatch<R, _LoadingConferenceState> loading,
    // ignore: library_private_types_in_public_api
    required ConferenceStateMatch<R, _NoSearchedConferenceState> noSearched,
    // ignore: library_private_types_in_public_api
    required ConferenceStateMatch<R, _NotFoundConferenceState> notFound,
    // ignore: library_private_types_in_public_api
    required ConferenceStateMatch<R, _LoadedConferenceState> loaded,
    // ignore: library_private_types_in_public_api
    required ConferenceStateMatch<R, _ErrorConferenceState> error,
  }) => switch (this) {
    _LoadingConferenceState s => loading(s),
    _NoSearchedConferenceState s => noSearched(s),
    _NotFoundConferenceState s => notFound(s),
    _LoadedConferenceState s => loaded(s),
    _ErrorConferenceState s => error(s),
  };

  R? maybeMap<R>({
    required R Function() orElse,

    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _LoadingConferenceState>? loading,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _NoSearchedConferenceState>? noSearched,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _NotFoundConferenceState>? notFound,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _LoadedConferenceState>? loaded,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _ErrorConferenceState>? error,
  }) => map<R>(
    loading: loading ?? (_) => orElse(),
    noSearched: noSearched ?? (_) => orElse(),
    notFound: notFound ?? (_) => orElse(),
    loaded: loaded ?? (_) => orElse(),
    error: error ?? (_) => orElse(),
  );

  R? mapOrNull<R>({
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _LoadingConferenceState>? loading,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _NoSearchedConferenceState>? noSearched,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _NotFoundConferenceState>? notFound,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _LoadedConferenceState>? loaded,
    // ignore: library_private_types_in_public_api
    ConferenceStateMatch<R, _ErrorConferenceState>? error,
  }) => map<R?>(
    loading: loading ?? (_) => null,
    noSearched: noSearched ?? (_) => null,
    notFound: notFound ?? (_) => null,
    loaded: loaded ?? (_) => null,
    error: error ?? (_) => null,
  );
}

final class _LoadingConferenceState extends ConferenceState {
  const _LoadingConferenceState();
}

final class _NoSearchedConferenceState extends ConferenceState {
  const _NoSearchedConferenceState();
}

final class _NotFoundConferenceState extends ConferenceState {
  const _NotFoundConferenceState();
}

final class _LoadedConferenceState extends ConferenceState {
  const _LoadedConferenceState({required this.conferences});
  final List<ConferenceEntity>? conferences;
}

final class _ErrorConferenceState extends ConferenceState {
  const _ErrorConferenceState({required this.message, this.stackTrace});
  final String message;
  final StackTrace? stackTrace;
}
