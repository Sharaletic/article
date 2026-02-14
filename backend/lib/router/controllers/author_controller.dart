import 'dart:convert';
import 'package:backend/app/app.dart';
import 'package:logger/logger.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../data/data.dart';

class AuthorController {
  AuthorController({
    required IAuthorRepository authorRepository,
    required this.logger,
  }) : _authorRepository = authorRepository;
  final IAuthorRepository _authorRepository;
  final Logger logger;

  Handler get handler {
    final router = Router();

    router.post('/author', createAuthor);

    return router.call;
  }

  Future<Response> createAuthor(Request request) async {
    final body = await request.readAsString();
    final json = jsonDecode(body);
    logger.info(json);
    final author = AuthorDtoCreated.fromJson(json).toEntity();

    await _authorRepository.createAuthor(author: author);

    return Response.ok(jsonEncode(json));
  }
}
