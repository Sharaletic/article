import '../../author.dart';

abstract interface class IOrganizationRepository {
  Future<List<OrganizationEntity>> getOrganizations();
  Future<List<OrganizationEntity>?> searchOrganizations({
    required String query,
  });
}
