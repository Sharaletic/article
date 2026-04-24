import '../../../../../app/app.dart';

class ConferenceEntity with EqualsMixin {
  ConferenceEntity({
    required this.id,
    required this.title,
    required this.endDate,
  });
  final int id;
  final String title;
  final DateTime endDate;

  @override
  String toString() =>
      '''Conference(
      id: $id,
      title: $title,
      endDate: $endDate)''';

  @override
  List<Object?> get fields => [id, title, endDate];
}
