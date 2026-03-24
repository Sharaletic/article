part of 'athor_bloc.dart';

typedef AthorStateMatch<R, S extends AthorState> = R Function(S state);

sealed class AthorState {
  const AthorState({required this.isEnabled});

  final bool isEnabled;

  const factory AthorState.initial({required bool isEnabled}) =
      _InitialAthorState;

  const factory AthorState.createdAthor({required bool isEnabled}) =
      _CreatedAthorState;

  const factory AthorState.loading({required bool isEnabled}) =
      _LoadingAthorState;

  const factory AthorState.enabled({required bool isEnabled}) =
      _EnabledAthorState;

  const factory AthorState.error({
    required bool isEnabled,
    required Object error,
    StackTrace? stackTrace,
  }) = _ErrorAthorState;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _InitialAthorState> initial,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _CreatedAthorState> createdAthor,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _LoadingAthorState> loading,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _EnabledAthorState> enabled,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _ErrorAthorState> error,
  }) {
    return switch (this) {
      _InitialAthorState s => initial(s),
      _CreatedAthorState s => createdAthor(s),
      _LoadingAthorState s => loading(s),
      _EnabledAthorState s => enabled(s),
      _ErrorAthorState s => error(s),
    };
  }

  R maybeMap<R>({
    required R Function() orElse,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _InitialAthorState>? initial,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _CreatedAthorState>? createdAthor,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _LoadingAthorState>? loading,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _EnabledAthorState>? enabled,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _ErrorAthorState>? error,
  }) {
    return map<R>(
      initial: initial ?? (_) => orElse(),
      createdAthor: createdAthor ?? (_) => orElse(),
      loading: loading ?? (_) => orElse(),
      enabled: enabled ?? (_) => orElse(),
      error: error ?? (_) => orElse(),
    );
  }

  R? mapOrNull<R>({
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _InitialAthorState>? initial,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _CreatedAthorState>? createdAthor,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _LoadingAthorState>? loading,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _EnabledAthorState>? enabled,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _ErrorAthorState>? error,
  }) {
    return map<R?>(
      initial: initial ?? (_) => null,
      createdAthor: createdAthor ?? (_) => null,
      loading: loading ?? (_) => null,
      enabled: enabled ?? (_) => null,
      error: error ?? (_) => null,
    );
  }
}

final class _InitialAthorState extends AthorState {
  const _InitialAthorState({required super.isEnabled});
}

final class _CreatedAthorState extends AthorState {
  const _CreatedAthorState({required super.isEnabled});
}

final class _LoadingAthorState extends AthorState {
  const _LoadingAthorState({required super.isEnabled});
}

final class _EnabledAthorState extends AthorState {
  const _EnabledAthorState({required super.isEnabled});
}

final class _ErrorAthorState extends AthorState {
  const _ErrorAthorState({
    required super.isEnabled,
    required this.error,
    this.stackTrace,
  });
  final Object error;
  final StackTrace? stackTrace;
}
