import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import '../../authentication.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  AuthenticationRepositoryImpl({required http.Client httpClient})
    : _httpClient = httpClient;
  final http.Client _httpClient;

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
      final user = userCredential.user;
      return UserDto.fromFirebase(user!).toEntity();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> createUser({
    required String emailAddress,
    required String password,
  }) async {}

  @override
  Future<UserEntity> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      final user = userCredential.user;
      return UserDto.fromFirebase(user!).toEntity();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('No user found for that email.');
      }
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }
}
