part of 'authentication_bloc.dart';

typedef AuthEventMatch<R, S extends AuthenticationEvent> = R Function(S event);

sealed class AuthenticationEvent {
  const AuthenticationEvent();

  const factory AuthenticationEvent.signup({
    required String email,
    required String password,
  }) = _SignupEvent;

  const factory AuthenticationEvent.login({
    required String email,
    required String password,
  }) = _LoginEvent;

  const factory AuthenticationEvent.updateDisplayName({required String name}) =
      _UpdateDisplayNameEvent;

  const factory AuthenticationEvent.logout() = _LogoutEvent;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required AuthEventMatch<R, _SignupEvent> signup,
    // ignore: library_private_types_in_public_api
    required AuthEventMatch<R, _LoginEvent> login,
    // ignore: library_private_types_in_public_api
    required AuthEventMatch<R, _LogoutEvent> logout,
    // ignore: library_private_types_in_public_api
    required AuthEventMatch<R, _UpdateDisplayNameEvent> updateDisplayName,
  }) => switch (this) {
    _SignupEvent s => signup(s),
    _LoginEvent s => login(s),
    _LogoutEvent s => logout(s),
    _UpdateDisplayNameEvent s => updateDisplayName(s),
  };
}

final class _SignupEvent extends AuthenticationEvent {
  const _SignupEvent({required this.email, required this.password});
  final String email;
  final String password;
}

final class _LoginEvent extends AuthenticationEvent {
  const _LoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

final class _UpdateDisplayNameEvent extends AuthenticationEvent {
  const _UpdateDisplayNameEvent({required this.name});
  final String name;
}

final class _LogoutEvent extends AuthenticationEvent {
  const _LogoutEvent();
}
