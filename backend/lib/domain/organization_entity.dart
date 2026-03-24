class OrganizationEntity {
  OrganizationEntity({
    required this.id,
    required this.titleRu,
    required this.titleEn,
  });
  final int id;
  final String titleRu;
  final String titleEn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationEntity &&
          id == other.id &&
          titleRu == other.titleRu &&
          titleEn == other.titleEn;

  @override
  int get hashCode => id.hashCode;
}
