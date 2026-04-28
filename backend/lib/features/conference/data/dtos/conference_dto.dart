import 'dart:convert';
import 'package:drift/drift.dart';
import '../../conference.dart';

class ConferenceFormatConverter
    extends TypeConverter<List<ConferenceFormat>?, String?> {
  const ConferenceFormatConverter();

  @override
  List<ConferenceFormat>? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;
    final list = jsonDecode(fromDb) as List<Object>;
    return list
        .map((format) => ConferenceFormat.fromString(format as String))
        .toList();
  }

  @override
  String? toSql(List<ConferenceFormat>? value) {
    if (value == null) return null;
    return jsonEncode(value.map((e) => e.value).toList());
  }

  List<ConferenceFormat> fromJson(List<dynamic>? json) {
    if (json == null || json.isEmpty) return [];
    return json
        .whereType<String>()
        .where((e) => e.isNotEmpty)
        .map(ConferenceFormat.fromString)
        .toList();
  }

  List<String> toJson(List<ConferenceFormat> formats) {
    return formats.map((e) => e.value).toList();
  }
}

class FileFormatConverter extends TypeConverter<List<FileFormat>?, String?> {
  const FileFormatConverter();

  @override
  List<FileFormat>? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;
    final list = jsonDecode(fromDb) as List<Object>;
    return list
        .map((format) => FileFormat.fromString(format as String))
        .toList();
  }

  @override
  String? toSql(List<FileFormat>? value) {
    if (value == null) return null;
    return jsonEncode(value.map((e) => e.value).toList());
  }

  List<FileFormat> fromJson(List<Object>? json) {
    if (json == null || json.isEmpty) return [];
    return json
        .whereType<String>()
        .where((e) => e.isNotEmpty)
        .map(FileFormat.fromString)
        .toList();
  }

  List<String> toJson(List<FileFormat> formats) {
    return formats.map((e) => e.value).toList();
  }
}

class ConferenceDto {
  ConferenceDto({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.startConferenceDate,
    required this.endConferenceDate,
    required this.address,
    required this.conferenceFormat,
    required this.submissionStartDate,
    required this.submissionEndDate,
    required this.quantityOfPages,
    required this.fileFormat,
    required this.requirements,
  });
  final int id;
  final String title;
  final String shortDescription;
  final DateTime startConferenceDate;
  final DateTime? endConferenceDate;
  final String address;
  final List<ConferenceFormat> conferenceFormat;
  final DateTime submissionStartDate;
  final DateTime submissionEndDate;
  final int quantityOfPages;
  final List<FileFormat> fileFormat;
  final String requirements;

  factory ConferenceDto.fromEntity(ConferenceEntity entity) => ConferenceDto(
    id: entity.id,
    title: entity.title,
    shortDescription: entity.shortDescription,
    startConferenceDate: entity.startConferenceDate,
    endConferenceDate: entity.endConferenceDate,
    address: entity.address,
    conferenceFormat: entity.conferenceFormat,
    submissionStartDate: entity.submissionStartDate,
    submissionEndDate: entity.submissionEndDate,
    quantityOfPages: entity.quantityOfPages,
    fileFormat: entity.fileFormat,
    requirements: entity.requirements,
  );

  ConferenceEntity toEntity() => ConferenceEntity(
    id: id,
    title: title,
    shortDescription: shortDescription,
    startConferenceDate: startConferenceDate,
    endConferenceDate: endConferenceDate,
    address: address,
    conferenceFormat: conferenceFormat,
    submissionStartDate: submissionStartDate,
    submissionEndDate: submissionEndDate,
    quantityOfPages: quantityOfPages,
    fileFormat: fileFormat,
    requirements: requirements,
  );

  // ConferencesCompanion toCompanion() => ConferencesCompanion(
  //   id: Value(id),
  //   title: Value(title),
  //   endDate: Value(endDate),
  // );

  factory ConferenceDto.fromJson(Map<String, Object?> json) => ConferenceDto(
    id: json['id'] as int,
    title: json['title'] as String,
    shortDescription: json['shortDescription'] as String,
    startConferenceDate: DateTime.parse(json['startConferenceDate'] as String),
    endConferenceDate: json['endConferenceDate'] != null
        ? DateTime.parse(json['endConferenceDate'] as String)
        : null,
    address: json['address'] as String,
    conferenceFormat: ConferenceFormatConverter().fromJson(
      json['conferenceFormat'] as List<dynamic>?,
    ),
    submissionStartDate: DateTime.parse(json['submissionStartDate'] as String),
    submissionEndDate: DateTime.parse(json['submissionEndDate'] as String),
    quantityOfPages: json['quantityOfPages'] as int,
    fileFormat: FileFormatConverter().fromJson(
      json['fileFormat'] as List<Object>?,
    ),
    requirements: json['requirements'] as String,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'title': title,
    'shortDescription': shortDescription,
    'startConferenceDate': startConferenceDate.toIso8601String(),
    if (endConferenceDate != null)
      'endConferenceDate': endConferenceDate!.toIso8601String(),
    'address': address,
    'conferenceFormat': ConferenceFormatConverter().toJson(conferenceFormat),
    'fileFormat': FileFormatConverter().toJson(fileFormat),
    'submissionStartDate': submissionStartDate.toIso8601String(),
    'submissionEndDate': submissionEndDate.toIso8601String(),
    'quantityOfPages': quantityOfPages,
    'requirements': requirements,
  };
}
