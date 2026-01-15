part of 'authentication_bloc.dart';

typedef AuthEventMatch<R, S extends AuthenticationEvent> = R Function(S event);

sealed class AuthenticationEvent {
  const AuthenticationEvent();

  const factory AuthenticationEvent.login({
    required String email,
    required String password,
  }) = _LoginEvent;

  const factory AuthenticationEvent.logout() = _LogoutEvent;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required AuthEventMatch<R, _LoginEvent> login,
    // ignore: library_private_types_in_public_api
    required AuthEventMatch<R, _LogoutEvent> logout,
  }) => switch (this) {
    _LoginEvent s => login(s),
    _LogoutEvent s => logout(s),
  };
}

final class _LoginEvent extends AuthenticationEvent {
  const _LoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

final class _LogoutEvent extends AuthenticationEvent {
  const _LogoutEvent();
}
