import 'package:backend/app/app.dart';
import 'package:logger/logger.dart';
import '../../../core/database/database.dart';
import '../../../domain/organization_entity.dart';
import '../dtos/organization_dto.dart';

abstract interface class IOrganizationRepository {
  Future<List<OrganizationEntity>?> getOrganizations();
}

class OrganizationRepositoryImpl implements IOrganizationRepository {
  OrganizationRepositoryImpl({
    required AppDatabase appDatabase,
    required this.logger,
  }) : _appDatabase = appDatabase;

  final AppDatabase _appDatabase;
  final Logger logger;

  @override
  Future<List<OrganizationEntity>?> getOrganizations() async {
    final query = await _appDatabase.select(_appDatabase.organization).get();
    logger.info(query);

    if (query.isEmpty) {
      return null;
    }

    final organizations = query
        .map((i) => OrganizationDto.fromDataBase(i).toEntity())
        .toList();
    logger.info(organizations);

    return organizations;
  }
}
