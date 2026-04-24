import '../../../../../core/rest_client/rest_client.dart';
import '../../author.dart';

class AuthorRepositoryImpl implements IAuthorRepository {
  AuthorRepositoryImpl({required RestClient httpClient})
    : _httpClient = httpClient;
  final RestClient _httpClient;

  @override
  Future<void> createAthor({required AuthorEntity author}) async {
    final authorDto = AuthorDto.fromEntity(author);
    await _httpClient.post(path: '/author', body: authorDto.toJson());
  }
}
