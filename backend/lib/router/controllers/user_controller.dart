import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../data/data.dart';

class UserController {
  UserController({required UserRepository userRepository})
    : _userRepository = userRepository;
  final UserRepository _userRepository;

  Handler get handler {
    final router = Router();

    router.post('/users', createUser);

    return router.call;
  }

  Future<Response> createUser(Request request) async {
    final body = await request.readAsString();
    final user = UserDto.fromJson(jsonDecode(body));

    final userDto = await _userRepository.createUser(userDto: user);
    final json = userDto.toJson();

    return Response.ok(jsonEncode(json));
  }
}
