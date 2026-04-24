import '../../../../../../../app/app.dart';

class SectionEntity with EqualsMixin {
  SectionEntity({required this.id, required this.title});
  final int id;
  final String title;

  @override
  String toString() =>
      '''SectionEntity(
      id: $id,
      title: $title)''';

  @override
  List<Object?> get fields => [id, title];
}
