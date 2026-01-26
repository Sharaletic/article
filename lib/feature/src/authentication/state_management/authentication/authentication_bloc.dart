import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required IAuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(const .notAuthenticated(user: NotAuthenticatedUser())) {
    on<AuthenticationEvent>((event, emit) async {
      await event.map(
        signup: (e) => _signup(e, emit),
        login: (e) => _login(e, emit),
        logout: (_) => _logout(emit),
      );
    }, transformer: droppable());
  }

  final IAuthenticationRepository _authenticationRepository;

  Future<void> _signup(
    _SignupEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final user = await _authenticationRepository.signup(
        emailAddress: event.email,
        password: event.password,
      );
      print(user);
      emit(AuthenticationState.successfull(user: user));
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        AuthenticationState.error(
          user: state.user,
          message: 'Ошибка регистрации',
        ),
      );
      rethrow;
    } finally {
      emit(
        state.user.when(
          authenticatedUser: (user) =>
              AuthenticationState.authenticated(user: user),
          notAuthenticatedUser: () =>
              const AuthenticationState.notAuthenticated(
                user: NotAuthenticatedUser(),
              ),
        ),
      );
    }
  }

  Future<void> _login(
    _LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final user = await _authenticationRepository.login(
        emailAddress: event.email,
        password: event.password,
      );
      emit(AuthenticationState.successfull(user: user));
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        AuthenticationState.error(
          user: state.user,
          message: 'Ошибка аутентификации',
        ),
      );
      rethrow;
    } finally {
      emit(
        state.user.when(
          authenticatedUser: (user) =>
              AuthenticationState.authenticated(user: user),
          notAuthenticatedUser: () =>
              const AuthenticationState.notAuthenticated(
                user: NotAuthenticatedUser(),
              ),
        ),
      );
    }
  }

  Future<void> _logout(Emitter<AuthenticationState> emit) async {
    try {
      await _authenticationRepository.logout();
      emit(
        const AuthenticationState.successfull(
          user: UserEntity.notAuthenticatedUser(),
        ),
      );
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        AuthenticationState.error(
          user: state.user,
          message: 'Ошибка аутентификации',
        ),
      );
      rethrow;
    } finally {
      emit(
        state.user.when(
          authenticatedUser: (user) =>
              AuthenticationState.authenticated(user: user),
          notAuthenticatedUser: () =>
              const AuthenticationState.notAuthenticated(
                user: NotAuthenticatedUser(),
              ),
        ),
      );
    }
  }
}
