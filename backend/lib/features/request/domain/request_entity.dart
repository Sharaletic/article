import '../../../app/app.dart';
import '../../author/domain/author_entity.dart';
import '../../conference/domain/conference_entity.dart';
import '../../selection/domain/selection_entity.dart';

class RequestEntity with EqualsMixin {
  RequestEntity({
    required this.id,
    required this.author,
    required this.conference,
    required this.section,
    this.coAuthors,
    required this.title,
    required this.status,
    this.comment,
    this.chat,
    required this.createdAt,
  });
  final int id;
  final AuthorEntity author;
  final ConferenceEntity conference;
  final SectionEntity section;
  final String? coAuthors;
  final String title;
  final String status;
  final String? comment;
  final int? chat;
  final DateTime createdAt;

  @override
  String toString() =>
      '''RequestEntity(
      id: $id,
      author: $author,
      conference: $conference,
      selection: $section,
      coAuthors: $coAuthors,
      title: $title,
      status: $status,
      comment: $comment,
      chat: $chat,
      createdAt: $createdAt)''';

  @override
  List<Object?> get fields => [
    id,
    author,
    conference,
    section,
    coAuthors,
    title,
    status,
    comment,
    chat,
    createdAt,
  ];
}
