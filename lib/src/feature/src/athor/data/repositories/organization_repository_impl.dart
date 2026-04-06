import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import '../../../../../core/core.dart';
import '../../author.dart';

class OrganizationRepositoryImpl implements IOrganizationRepository {
  OrganizationRepositoryImpl({
    required RestClient httpClient,
    required this.logger,
  }) : _httpClient = httpClient;
  final RestClient _httpClient;
  final Logger logger;

  @override
  Future<List<OrganizationEntity>> getOrganizations() async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();

    final body = await _httpClient.get(
      path: '/organizations',
      headers: {'Authorization': token!},
    );

    if (body case <String, Object?>{
      'organizations': List<Object?> list,
    } when list.isNotEmpty) {
      final organizations = list
          .whereType<Map<String, Object?>>()
          .map((e) => OrganizationDto.fromJson(e).toEntity())
          .toList();
      return organizations;
    } else {
      throw StructuredBackendException(
        error: {'details': 'Invalid data received from server.'},
      );
    }
  }

  @override
  Future<List<OrganizationEntity>?> searchOrganizations({
    required String query,
  }) async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();

    final body = await _httpClient.get(
      path: '/organizations',
      headers: {'Authorization': token!},
      queryParameters: {'query': query},
    );

    if (body case <String, Object?>{
      'organizations': List<Object?> list,
    } when list.isNotEmpty) {
      final organizations = list
          .whereType<Map<String, Object?>>()
          .map((e) => OrganizationDto.fromJson(e).toEntity())
          .toList();
      return organizations;
    } else if (body case <String, Object?>{
      'organizations': List<Object?> list,
    } when list.isEmpty) {
      return null;
    } else {
      throw StructuredBackendException(
        error: {'details': 'Invalid data received from server.'},
      );
    }
  }
}
