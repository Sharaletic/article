import '../../conference.dart';

class ConferenceDto {
  ConferenceDto({required this.id, required this.title, required this.endDate});
  final int id;
  final String title;
  final DateTime endDate;

  factory ConferenceDto.fromEntity(ConferenceEntity entity) => ConferenceDto(
    id: entity.id,
    title: entity.title,
    endDate: entity.endDate,
  );

  ConferenceEntity toEntity() =>
      ConferenceEntity(id: id, title: title, endDate: endDate);

  factory ConferenceDto.fromJson(Map<String, Object> json) => ConferenceDto(
    id: json['id'] as int,
    title: json['title'] as String,
    endDate: DateTime.parse(json['endDate'] as String),
  );

  Map<String, Object> toJson() => {
    'id': id,
    'title': title,
    'endDate': endDate,
  };
}
