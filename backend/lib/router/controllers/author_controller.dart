import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../data/data.dart';

class AuthorController {
  AuthorController({required AuthorRepository authorRepository})
    : _authorRepository = authorRepository;
  final AuthorRepository _authorRepository;

  Handler get handler {
    final router = Router();

    router.post('/author', createAuthor);

    return router.call;
  }

  Future<Response> createAuthor(Request request) async {
    final body = await request.readAsString();
    final json = jsonDecode(body);
    final author = AuthorDtoCreated.fromJson(json).toEntity();

    await _authorRepository.createAuthor(author: author);

    return Response.ok(jsonEncode(json));
  }
}
