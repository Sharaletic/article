import '../../conference.dart';

List<ConferenceFormat> _conferenceFormatFromJson(List<dynamic> json) {
  return json.whereType<String>().map(ConferenceFormat.fromString).toList();
}

List<FileFormat> _fileFormatFromJson(List<dynamic> json) {
  return json.whereType<String>().map(FileFormat.fromString).toList();
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

  factory ConferenceDto.fromJson(Map<String, Object?> json) => ConferenceDto(
    id: json['id'] as int,
    title: json['title'] as String,
    shortDescription: json['shortDescription'] as String,
    startConferenceDate: DateTime.parse(json['startConferenceDate'] as String),
    endConferenceDate: json['endConferenceDate'] == null
        ? null
        : DateTime.parse(json['endConferenceDate'] as String),
    address: json['address'] as String,
    conferenceFormat: _conferenceFormatFromJson(
      json['conferenceFormat'] as List<dynamic>,
    ),
    submissionStartDate: DateTime.parse(json['submissionStartDate'] as String),
    submissionEndDate: DateTime.parse(json['submissionEndDate'] as String),
    quantityOfPages: json['quantityOfPages'] as int,
    fileFormat: _fileFormatFromJson(json['fileFormat'] as List<dynamic>),
    requirements: json['requirements'] as String,
  );

  Map<String, Object> toJson() => {
    'id': id,
    'title': title,
    'shortDescription': shortDescription,
    'startConferenceDate': startConferenceDate,
    if (endConferenceDate != null)
      'endConferenceDate': endConferenceDate!.toIso8601String(),
    'address': address,
    'conferenceFormat': conferenceFormat,
    'submissionStartDate': submissionStartDate,
    'submissionEndDate': submissionEndDate,
    'quantityOfPages': quantityOfPages,
    'fileFormat': fileFormat,
    'requirements': requirements,
  };
}
