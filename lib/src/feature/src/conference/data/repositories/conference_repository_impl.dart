import '../../../../../core/core.dart';
import '../../conference.dart';

class ConferenceRepositoryImpl implements IConferenceRepository {
  ConferenceRepositoryImpl({required RestClient restClient})
    : _restClient = restClient;
  final RestClient _restClient;

  @override
  Future<List<ConferenceEntity>?> searchConferences({
    required String query,
  }) async {
    final body = await _restClient.get(
      path: '/conferences',
      queryParameters: {'query': query},
    );
    if (body case {
      'conferences': final List<Object?> conferences,
    } when conferences.isNotEmpty) {
      return conferences
          .whereType<Map<String, Object?>>()
          .map((json) => ConferenceDto.fromJson(json).toEntity())
          .toList();
    } else if (body case {
      'conferences': final List<Object?> conferences,
    } when conferences.isEmpty) {
      return null;
    } else {
      throw StructuredBackendException(
        error: {'details': 'Invalid data received from server.'},
      );
    }
  }
}
