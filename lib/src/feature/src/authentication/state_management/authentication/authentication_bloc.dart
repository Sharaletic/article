import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

mixin _SetStateMixin<State extends Object> implements Emittable<State> {
  void setState(State state) => emit(state);
}

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with _SetStateMixin<AuthenticationState> {
  AuthenticationBloc({
    required IAuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(.notAuthenticated(user: NotAuthenticatedUser())) {
    _authSubscription = _authenticationRepository.getAuthState().listen(
      (user) {
        user.when(
          authenticatedUser: (user) => setState(.authenticated(user: user)),
          notAuthenticatedUser: () =>
              setState(const .notAuthenticated(user: NotAuthenticatedUser())),
        );
      },
      onError: (error, stackTrace) => setState(
        .error(user: state.user, error: error, stackTrace: stackTrace),
      ),
    );
    on<AuthenticationEvent>((event, emit) async {
      await event.map(
        signup: (e) => _signup(e, emit),
        login: (e) => _login(e, emit),
        updateDisplayName: (e) => _updateDisplayName(e, emit),
        logout: (_) => _logout(emit),
      );
    }, transformer: droppable());
  }

  final IAuthenticationRepository _authenticationRepository;
  late final StreamSubscription _authSubscription;

  Future<void> _signup(
    _SignupEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationRepository.signup(
        emailAddress: event.email,
        password: event.password,
      );
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(.error(user: state.user, error: error, stackTrace: stackTrace));
      rethrow;
    }
  }

  Future<void> _login(
    _LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationRepository.login(
        emailAddress: event.email,
        password: event.password,
      );
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(.error(user: state.user, error: error, stackTrace: stackTrace));
      rethrow;
    }
  }

  Future<void> _updateDisplayName(
    _UpdateDisplayNameEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final user = await _authenticationRepository.updateDisplayName(
        name: event.name,
      );
      emit(.successfull(user: user));
      emit(.authenticated(user: user));
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(.error(user: state.user, error: error, stackTrace: stackTrace));
      rethrow;
    }
  }

  Future<void> _logout(Emitter<AuthenticationState> emit) async {
    try {
      await _authenticationRepository.logout();
      emit(const .successfull(user: NotAuthenticatedUser()));
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(.error(user: state.user, error: error, stackTrace: stackTrace));
      rethrow;
    } finally {
      emit(
        state.user.when(
          authenticatedUser: (user) => .authenticated(user: user),
          notAuthenticatedUser: () =>
              const .notAuthenticated(user: NotAuthenticatedUser()),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
