part of 'authentication_bloc.dart';

typedef AuthenticationStateMatch<R, S extends AuthenticationState> =
    R Function(S state);

sealed class AuthenticationState {
  const AuthenticationState({required this.user});

  final UserEntity user;

  bool get isAuthenticated => user.isAuthenticated;

  const factory AuthenticationState.authenticated({
    required final AuthenticatedUser user,
  }) = _AuthenticatedAuthenticationState;

  const factory AuthenticationState.notAuthenticated({
    required final NotAuthenticatedUser user,
  }) = _NotAuthenticatedAuthenticationState;

  const factory AuthenticationState.error({
    required final UserEntity user,
    required String message,
  }) = _ErrorAuthenticationState;

  const factory AuthenticationState.successfull({
    required final UserEntity user,
  }) = _SuccessfullAuthenticationState;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required AuthenticationStateMatch<R, _AuthenticatedAuthenticationState>
    authenticated,
    // ignore: library_private_types_in_public_api
    required AuthenticationStateMatch<R, _NotAuthenticatedAuthenticationState>
    notAuthenticated,
    // ignore: library_private_types_in_public_api
    required AuthenticationStateMatch<R, _ErrorAuthenticationState> error,
    // ignore: library_private_types_in_public_api
    required AuthenticationStateMatch<R, _SuccessfullAuthenticationState>
    successfull,
  }) => switch (this) {
    _AuthenticatedAuthenticationState s => authenticated(s),
    _NotAuthenticatedAuthenticationState s => notAuthenticated(s),
    _ErrorAuthenticationState s => error(s),
    _SuccessfullAuthenticationState s => successfull(s),
  };

  R maybeMap<R>({
    required R Function() orElse,
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _AuthenticatedAuthenticationState>?
    authenticated,
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _NotAuthenticatedAuthenticationState>?
    notAuthenticated,
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _ErrorAuthenticationState>? error,
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _SuccessfullAuthenticationState>? successfull,
  }) => map<R>(
    authenticated: authenticated ?? (_) => orElse(),
    notAuthenticated: notAuthenticated ?? (_) => orElse(),
    error: error ?? (_) => orElse(),
    successfull: successfull ?? (_) => orElse(),
  );

  R? mapOrNull<R>({
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _AuthenticatedAuthenticationState>?
    authenticated,
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _NotAuthenticatedAuthenticationState>?
    notAuthenticated,
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _ErrorAuthenticationState>? error,
    // ignore: library_private_types_in_public_api
    AuthenticationStateMatch<R, _SuccessfullAuthenticationState>? successfull,
  }) => map<R?>(
    authenticated: authenticated ?? (_) => null,
    notAuthenticated: notAuthenticated ?? (_) => null,
    error: error ?? (_) => null,
    successfull: successfull ?? (_) => null,
  );
}

final class _AuthenticatedAuthenticationState extends AuthenticationState {
  const _AuthenticatedAuthenticationState({required super.user});
}

final class _NotAuthenticatedAuthenticationState extends AuthenticationState {
  const _NotAuthenticatedAuthenticationState({required super.user});
}

final class _ErrorAuthenticationState extends AuthenticationState {
  const _ErrorAuthenticationState({required super.user, required this.message});
  final String message;
}

final class _SuccessfullAuthenticationState extends AuthenticationState {
  const _SuccessfullAuthenticationState({required super.user});
}
