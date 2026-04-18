import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/core.dart';
import '../../authentication.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  AuthenticationRepositoryImpl({required this.restClientHttp});
  final RestClient restClientHttp;

  @override
  Future<void> signup({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // final userDto = UserDto.fromFirebase(
      //   user: userCredential.user!,
      //   role: UserRole.author,
      // );
      // return userDto.toEntity();
    } on Object catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // final user = userCredential.user;
      // final idTokenResult = await user!.getIdTokenResult(true);
      // final role = idTokenResult.claims!['role'];

      // return UserDto.fromFirebase(user: user, role: role).toEntity();
    } on Object catch (error) {
      throw Exception(error);
    }
  }

  Future<UserRole?> _getUserRoleFromClaims() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final idTokenResult = await user.getIdTokenResult();
      final roleFromClaims = idTokenResult.claims?['role'];
      if (roleFromClaims != null && roleFromClaims is String) {
        return UserRole.values.firstWhere(
          (role) => role.value == roleFromClaims,
        );
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Stream<UserEntity> getAuthState() {
    final StreamController<UserEntity> controller =
        StreamController<UserEntity>();
    FirebaseAuth.instance.authStateChanges().listen(
      (user) async {
        if (user != null) {
          try {
            final role = await _getUserRoleFromClaims();
            if (role == null) {
              controller.add(UserDto.fromFirebase(user: user).toEntity());
            } else {
              controller.add(
                UserDto.fromFirebase(user: user, role: role).toEntity(),
              );
            }
          } catch (e) {
            controller.addError(e);
          }
        } else {
          controller.add(const NotAuthenticatedUser());
        }
      },
      onDone: () => controller.close(),
      onError: (error) => controller.addError(error),
    );
    return controller.stream;
  }

  @override
  Future<UserEntity> updateDisplayName({required String name}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.updateDisplayName(name);
      user.reload();
      final newUser = FirebaseAuth.instance.currentUser;

      return UserDto.fromFirebase(
        user: newUser!,
        role: UserRole.author,
      ).toEntity();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }
}
