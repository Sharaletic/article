import '../../../../../core/core.dart';
import '../../request.dart';

class RequestRepository implements IRequestRepository {
  RequestRepository({required RestClient restClient})
    : _httpClient = restClient;
  final RestClient _httpClient;

  @override
  Future<void> createRequest({required RequestEntity request}) async {
    await _httpClient.post(
      path: '/request',
      body: RequestDto.fromEntity(request).toJson(),
    );
  }
}
