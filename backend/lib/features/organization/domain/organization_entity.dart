import '../../../app/app.dart';

class OrganizationEntity with EqualsMixin {
  OrganizationEntity({
    required this.id,
    required this.titleRu,
    required this.titleEn,
  });
  final int id;
  final String titleRu;
  final String titleEn;

  @override
  List<Object?> get fields => [id, titleRu, titleEn];
}
