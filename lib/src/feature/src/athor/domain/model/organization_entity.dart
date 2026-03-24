class OrganizationEntity {
  const OrganizationEntity({
    this.id,
    required this.titleRu,
    required this.titleEn,
  });
  final int? id;
  final String titleRu;
  final String titleEn;
}
