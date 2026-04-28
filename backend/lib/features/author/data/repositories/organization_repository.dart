import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import '../../../../core/database/database.dart';
import '../../../../core/rest_client/api_server.dart';
import '../../domain/organization_entity.dart';
import '../dtos/organization_dto.dart';

abstract interface class IOrganizationRepository {
  Future<List<OrganizationEntity?>> getOrganizations();
  Future<List<OrganizationEntity>> searchOrganizations({required String query});
}

class OrganizationRepositoryImpl implements IOrganizationRepository {
  OrganizationRepositoryImpl({
    required AppDatabase appDatabase,
    required this.logger,
  }) : _appDatabase = appDatabase;

  final AppDatabase _appDatabase;
  final Logger logger;

  @override
  Future<List<OrganizationEntity?>> getOrganizations() async {
    final query = await _appDatabase.select(_appDatabase.organization).get();

    if (query.isEmpty) {
      throw NotFoundException(message: 'Organizations not found');
    }

    final organizations = query
        .map((row) => OrganizationDto.fromDataBase(row).toEntity())
        .toList();

    return organizations;
  }

  @override
  Future<List<OrganizationEntity>> searchOrganizations({
    required String query,
  }) async {
    final pattern = '%$query%';
    final data =
        await (_appDatabase.select(_appDatabase.organization)..where((row) {
              return row.titleRu.like(pattern) | row.titleEn.like(pattern);
            }))
            .get();

    final result = data
        .map((row) => OrganizationDto.fromDataBase(row).toEntity())
        .toList();

    return result;
  }
}
