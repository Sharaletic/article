import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../core/rest_client/api_server.dart';
import '../../data/data.dart';

class AuthorController {
  AuthorController({
    required IAuthorRepository authorRepository,
    required ApiServer apiServer,
  }) : _authorRepository = authorRepository,
       _apiServer = apiServer;

  final IAuthorRepository _authorRepository;
  final ApiServer _apiServer;

  Handler get handler {
    final router = Router();

    router.post('/author', createAuthor);

    return router.call;
  }

  Future<Response> createAuthor(Request request) async {
    final body = await request.readAsString();
    final json = jsonDecode(body);
    final author = AuthorDto.fromJson(json).toEntity();
    print(author.educationLevel);

    await _authorRepository.createAuthor(author: author);

    return _apiServer.sendResponse(201);
  }
}
