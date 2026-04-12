import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/rest_client/rest_client.dart';
import '../../authentication.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  AuthenticationRepositoryImpl({required this.restClientHttp});
  final RestClient restClientHttp;

  @override
  Future<UserEntity> signup({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      final userDto = UserDto.fromFirebase(
        user: userCredential.user!,
        role: UserRole.author,
      );
      return userDto.toEntity();
    } on Object catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<UserEntity> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      final user = userCredential.user;
      final idTokenResult = await user!.getIdTokenResult(true);
      final role = idTokenResult.claims!['role'];

      return UserDto.fromFirebase(user: user, role: role).toEntity();
    } on Object catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<UserEntity> updateDisplayName({required String name}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.updateDisplayName(name);
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
