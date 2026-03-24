import '../../../core/database/database.dart';
import '../../../core/rest_client/api_server.dart';
import '../../../domain/organization_entity.dart';

class OrganizationDto {
  OrganizationDto({
    required this.id,
    required this.titleRu,
    required this.titleEn,
  });
  final int id;
  final String titleRu;
  final String titleEn;

  factory OrganizationDto.fromEntity(OrganizationEntity organization) =>
      OrganizationDto(
        id: organization.id,
        titleRu: organization.titleRu,
        titleEn: organization.titleEn,
      );

  factory OrganizationDto.fromJson(Map<String, Object?> json) {
    try {
      return OrganizationDto(
        id: json['id'] as int,
        titleRu: json['title_ru'] as String,
        titleEn: json['title_en'] as String,
      );
    } catch (e) {
      throw JsonDeserializationException(
        message: 'Error when deserializing OrganizationDto from JSON',
        cause: e,
      );
    }
  }

  factory OrganizationDto.fromDataBase(OrganizationData organization) =>
      OrganizationDto(
        id: organization.id,
        titleRu: organization.titleRu,
        titleEn: organization.titleEn,
      );

  OrganizationEntity toEntity() =>
      OrganizationEntity(id: id, titleRu: titleRu, titleEn: titleEn);

  Map<String, Object?> toJson() => {
    'id': id,
    'title_ru': titleRu,
    'title_en': titleEn,
  };
}
