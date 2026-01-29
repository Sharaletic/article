enum UserRole { author, reviewer, editor, admin }

abstract class UserEntity {
  const factory UserEntity.notAuthenticatedUser() = NotAuthenticatedUser;

  const factory UserEntity.authenticatedUser({
    required String uid,
    required String emailAddress,
    UserRole? role,
    String? displayName,
    String? photoUrl,
  }) = AuthenticatedUser;

  bool get isAuthenticated;
  bool get isNotAuthenticated;
  AuthenticatedUser? get authenticatedOrNull;

  T when<T extends Object?>({
    required final T Function(AuthenticatedUser user) authenticatedUser,
    required final T Function() notAuthenticatedUser,
  });
}

class NotAuthenticatedUser implements UserEntity {
  const NotAuthenticatedUser();

  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => true;

  @override
  get authenticatedOrNull => null;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUser user) authenticatedUser,
    required final T Function() notAuthenticatedUser,
  }) => notAuthenticatedUser();

  @override
  String toString() => 'User is not authenticated';

  @override
  bool operator ==(Object other) => other is NotAuthenticatedUser;

  @override
  int get hashCode => 0;
}

class AuthenticatedUser implements UserEntity {
  const AuthenticatedUser({
    required this.uid,
    required this.emailAddress,
    this.role,
    this.displayName,
    this.photoUrl,
  });

  final String uid;
  final String emailAddress;
  final UserRole? role;
  final String? displayName;
  final String? photoUrl;

  @override
  bool get isAuthenticated => !isNotAuthenticated;

  @override
  bool get isNotAuthenticated => uid.isEmpty;

  @override
  AuthenticatedUser? get authenticatedOrNull =>
      isNotAuthenticated ? null : this;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUser user) authenticatedUser,
    required final T Function() notAuthenticatedUser,
  }) => authenticatedUser(this);

  @override
  String toString() => 'User is authenticated';

  @override
  bool operator ==(Object other) => other is AuthenticatedUser;

  @override
  int get hashCode => 0;
}
