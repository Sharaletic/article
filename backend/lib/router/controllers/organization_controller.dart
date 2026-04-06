import 'package:backend/domain/organization_entity.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../core/rest_client/api_server.dart';
import '../../data/data.dart';

class OrganizationController {
  OrganizationController({
    required IOrganizationRepository organizationRepository,
    required ApiServer apiServer,
  }) : _organizationRepository = organizationRepository,
       _apiServer = apiServer;

  final IOrganizationRepository _organizationRepository;
  final ApiServer _apiServer;

  Handler get handler {
    final router = Router();

    router.get('/organizations', searchOrganizations);

    return router.call;
  }

  Future<Response> searchOrganizations(Request request) async {
    final query = request.url.queryParameters['query'];
    List<OrganizationEntity?> organizations = [];
    if (query != null && query.isNotEmpty) {
      organizations = await _organizationRepository.searchOrganizations(
        query: query,
      );
    }
    final json = organizations.isNotEmpty
        ? organizations
              .map((e) => OrganizationDto.fromEntity(e!).toJson())
              .toList()
        : organizations;
    return _apiServer.sendResponse(
      200,
      body: {
        'data': {'organizations': json},
      },
    );
  }

  // Future<Response> getOrganizations(Request request) async {
  //   final organizations = await _organizationRepository.getOrganizations();
  //   if (organizations == null) {
  //     throw NotFoundException(message: 'Organizations not found');
  //   }
  //   final json = organizations
  //       .map((e) => OrganizationDto.fromEntity(e).toJson())
  //       .toList();

  //   return _apiServer.sendResponse(
  //     200,
  //     body: {
  //       'data': {'organizations': json},
  //     },
  //   );
  // }
}
