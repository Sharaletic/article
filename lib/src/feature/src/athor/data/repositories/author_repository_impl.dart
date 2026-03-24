import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/rest_client/rest_client.dart';
import '../../author.dart';

class AuthorRepositoryImpl implements IAuthorRepository {
  AuthorRepositoryImpl({required RestClient httpClient})
    : _httpClient = httpClient;
  final RestClient _httpClient;

  @override
  Future<void> createAthor({required AuthorEntity author}) async {
    final user = FirebaseAuth.instance.currentUser;

    String token;
    try {
      final tokenOrNull = await user!.getIdToken();
      if (tokenOrNull == null) {
        throw const AuthenticationTokenException();
      }
      token = tokenOrNull;
    } on Object catch (error) {
      throw Exception(error);
    }

    final authorDto = AuthorDto.fromEntity(author: author);

    await _httpClient.post(
      path: '/author',
      headers: {'Authorization': token},
      body: authorDto.toJson(),
    );
  }
}
