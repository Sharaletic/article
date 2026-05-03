import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../../core/rest_client/api_server.dart';
import '../../conference.dart';

class ConferenceController {
  ConferenceController({
    required IConferenceRepository conferenceRepository,
    required ApiServer apiServer,
  }) : _conferenceRepository = conferenceRepository,
       _apiServer = apiServer;
  final IConferenceRepository _conferenceRepository;
  final ApiServer _apiServer;

  Handler get handler {
    final router = Router();

    router.get('/conferences', searchConferences);

    return router.call;
  }

  Future<Response> searchConferences(Request request) async {
    final query = request.url.queryParameters['query'];
    List<ConferenceEntity?> confrences = [];
    if (query != null && query.isNotEmpty) {
      confrences = await _conferenceRepository.searchConferences(query: query);
    }
    final json = confrences.isNotEmpty
        ? confrences.map((e) => ConferenceDto.fromEntity(e!).toJson()).toList()
        : confrences;

    print(json);
    return _apiServer.sendResponse(
      200,
      body: {
        'data': {'conferences': json},
      },
    );
  }
}
