import '../../../../../app/app.dart';
import '../../../../../core/core.dart';

enum ConferenceFormat {
  online('Онлайн'),
  offline('Оффлайн'),
  hybrid('Гибридный');

  const ConferenceFormat(this.value);
  final String value;

  static ConferenceFormat fromString(String? value) {
    if (value == null || value.isEmpty) {
      throw StructuredBackendException(
        error: {
          'details':
              'Invalid conference format: value cannot be null or empty.',
        },
      );
    }
    final normalized = value.trim().toLowerCase();

    return switch (normalized) {
      'онлайн' => .online,
      'оффлайн' => .offline,
      'гибридный' => .hybrid,
      _ => throw StructuredBackendException(
        error: {
          'details': 'Invalid conference format $value received from server.',
        },
      ),
    };
  }
}

enum FileFormat {
  word('Word'),
  pdf('PDF');

  const FileFormat(this.value);
  final String value;

  static FileFormat fromString(String? value) {
    if (value == null || value.isEmpty) {
      throw StructuredBackendException(
        error: {
          'details': 'Invalid file format: value cannot be null or empty.',
        },
      );
    }
    final normalized = value.trim().toLowerCase();

    return switch (normalized) {
      'word' => .word,
      'pdf' => .pdf,
      _ => throw StructuredBackendException(
        error: {'details': 'Invalid file format $value received from server.'},
      ),
    };
  }
}

class ConferenceEntity with EqualsMixin {
  ConferenceEntity({
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

  @override
  String toString() =>
      '''Conference(
      id: $id,
      title: $title,
      shortDescription: $shortDescription,
      startConferenceDate: $startConferenceDate,
      endConferenceDate: $endConferenceDate,
      address: $address,
      conferenceFormat: $conferenceFormat,
      submissionStartDate: $submissionStartDate,
      submissionEndDate: $submissionEndDate,
      quantityOfPages: $quantityOfPages,
      fileFormat: $fileFormat,
      requirements: $requirements,
    )''';

  @override
  List<Object?> get fields => [
    id,
    title,
    shortDescription,
    startConferenceDate,
    endConferenceDate,
    address,
    conferenceFormat,
    submissionStartDate,
    submissionEndDate,
    quantityOfPages,
    fileFormat,
    requirements,
  ];
}
