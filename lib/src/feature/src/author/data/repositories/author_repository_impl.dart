import '../../../../../core/rest_client/rest_client.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

class AuthorRepositoryImpl implements IAuthorRepository {
  AuthorRepositoryImpl({required RestClient httpClient})
    : _httpClient = httpClient;
  final RestClient _httpClient;

  @override
  Future<void> createAuthor({required AuthenticatedUser user}) async {
    await _httpClient.post(
      path: '/author',
      body: AuthorDtoCreated(user: user).toJson(),
    );
  }
}
