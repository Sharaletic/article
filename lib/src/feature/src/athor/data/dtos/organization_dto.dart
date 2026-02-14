import '../../author.dart';

class OrganizationDto {
  const OrganizationDto({
    required this.id,
    required this.titleRu,
    required this.titleEn,
  });
  final int id;
  final String titleRu;
  final String titleEn;

  factory OrganizationDto.fromEntity({required OrganizationEntity entity}) =>
      OrganizationDto(
        id: entity.id,
        titleRu: entity.titleRu,
        titleEn: entity.titleEn,
      );

  factory OrganizationDto.fromJson({required Map<String, dynamic> json}) =>
      OrganizationDto(
        id: json['id'],
        titleRu: json['title_ru'],
        titleEn: json['title_en'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title_ru': titleRu,
    'title_en': titleEn,
  };
}
