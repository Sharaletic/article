import '../../../../../core/rest_client/rest_client.dart';
import '../../author.dart';

class AuthorRepositoryImpl implements IAuthorRepository {
  AuthorRepositoryImpl({required RestClient restClient})
    : _restClient = restClient;
  final RestClient _restClient;

  @override
  Future<void> createAthor({required AuthorEntity author}) async {
    final authorDto = AuthorDto.fromEntity(author);
    await _restClient.post(path: '/author', body: authorDto.toJson());
  }
}
