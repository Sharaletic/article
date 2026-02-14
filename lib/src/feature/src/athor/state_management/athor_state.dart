part of 'athor_bloc.dart';

typedef AthorStateMatch<R, S extends AthorState> = R Function(S state);

sealed class AthorState {
  const AthorState();

  const factory AthorState.initial() = _InitialAthorState;

  const factory AthorState.createdAthor() = _CreatedAthorState;

  const factory AthorState.error({required String message}) = _ErrorAthorState;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _InitialAthorState> initial,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _CreatedAthorState> createdAthor,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _ErrorAthorState> error,
  }) {
    return switch (this) {
      _InitialAthorState s => initial(s),
      _CreatedAthorState s => createdAthor(s),
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
    required AthorStateMatch<R, _ErrorAthorState>? error,
  }) {
    return map<R>(
      initial: initial ?? (_) => orElse(),
      createdAthor: createdAthor ?? (_) => orElse(),
      error: error ?? (_) => orElse(),
    );
  }

  R? mapOrNull<R>({
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _InitialAthorState>? initial,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _CreatedAthorState>? createdAthor,
    // ignore: library_private_types_in_public_api
    required AthorStateMatch<R, _ErrorAthorState>? error,
  }) {
    return map<R?>(
      initial: initial ?? (_) => null,
      createdAthor: createdAthor ?? (_) => null,
      error: error ?? (_) => null,
    );
  }
}

final class _InitialAthorState extends AthorState {
  const _InitialAthorState();
}

final class _CreatedAthorState extends AthorState {
  const _CreatedAthorState();
}

final class _ErrorAthorState extends AthorState {
  const _ErrorAthorState({required this.message});
  final String message;
}
