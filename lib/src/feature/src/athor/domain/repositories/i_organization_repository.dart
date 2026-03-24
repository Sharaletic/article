import '../../author.dart';

abstract interface class IOrganizationRepository {
  Future<List<OrganizationEntity>> getOrganizations();
}
