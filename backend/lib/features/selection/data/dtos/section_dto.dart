import 'package:drift/drift.dart';
import '../../../../core/database/database.dart';
import '../../selection.dart';

class SectionDto {
  SectionDto({required this.id, required this.title});
  final int id;
  final String title;

  factory SectionDto.fromEntity(SectionEntity entity) {
    return SectionDto(id: entity.id, title: entity.title);
  }

  SectionEntity toEntity() {
    return SectionEntity(id: id, title: title);
  }

  SectionsCompanion toCompanion() {
    return SectionsCompanion(id: Value(id), title: Value(title));
  }

  factory SectionDto.fromJson(Map<String, Object> json) {
    return SectionDto(id: json['id'] as int, title: json['title'] as String);
  }

  Map<String, Object> toJson() {
    return {'id': id, 'title': title};
  }
}
