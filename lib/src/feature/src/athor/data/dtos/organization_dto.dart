import '../../author.dart';

class OrganizationDto {
  const OrganizationDto({
    this.id,
    required this.titleRu,
    required this.titleEn,
  });
  final int? id;
  final String titleRu;
  final String titleEn;

  factory OrganizationDto.fromEntity(OrganizationEntity entity) =>
      OrganizationDto(
        id: entity.id,
        titleRu: entity.titleRu,
        titleEn: entity.titleEn,
      );

  factory OrganizationDto.fromJson(Map<String, Object?> json) =>
      OrganizationDto(
        id: json['id'] as int,
        titleRu: json['title_ru'] as String,
        titleEn: json['title_en'] as String,
      );

  OrganizationEntity toEntity() =>
      OrganizationEntity(id: id, titleRu: titleRu, titleEn: titleEn);

  Map<String, dynamic> toJson() => {
    'id': id,
    'title_ru': titleRu,
    'title_en': titleEn,
  };
}
