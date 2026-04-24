import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../../../core/rest_client/api_server.dart';
import '../../request.dart';

class RequestController {
  RequestController({
    required IRequestRepository requestRepository,
    required ApiServer apiServer,
  }) : _requestRepository = requestRepository,
       _apiServer = apiServer;

  final IRequestRepository _requestRepository;
  final ApiServer _apiServer;

  Handler get handler {
    final router = Router();

    router.post('/request', createRequest);

    return router.call;
  }

  Future<Response> createRequest(Request request) async {
    final body = await request.readAsString();
    final json = jsonDecode(body);
    final requestEntity = RequestDto.fromJson(json).toEntity();

    await _requestRepository.createRequest(request: requestEntity);

    return _apiServer.sendResponse(201);
  }
}
