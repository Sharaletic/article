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

      final idTokenResult = await userCredential.user!.getIdTokenResult();
      print(idTokenResult.token);
      await createUser(userDto: userDto, jwtToken: idTokenResult.token!);
      return userDto.toEntity();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> createUser({
    required UserDto userDto,
    required String jwtToken,
  }) async {
    try {
      await restClientHttp.post(
        path: '/author',
        body: userDto.toJson(),
        headers: {'jwt_token': jwtToken},
      );
    } catch (e) {
      throw Exception(e.toString());
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
      final idTokenResult = await user!.getIdTokenResult();
      print('idTokenResult: ${idTokenResult.token}');

      print('Custom Claims: ${idTokenResult.claims}');
      return UserDto.fromFirebase(user: user, role: UserRole.author).toEntity();
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
