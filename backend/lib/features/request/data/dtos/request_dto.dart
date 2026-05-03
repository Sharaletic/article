import 'package:drift/drift.dart';
import '../../../../core/database/database.dart';
import '../../../author/author.dart';
import '../../../conference/data/dtos/conference_dto.dart';
import '../../../selection/data/dtos/section_dto.dart';
import '../../request.dart';

class RequestDto {
  RequestDto({
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
  final AuthorDto author;
  final ConferenceDto conference;
  final SectionDto section;
  final String? coAuthors;
  final String title;
  final String status;
  final String? comment;
  final int? chat;
  final DateTime createdAt;

  factory RequestDto.fromEntity(RequestEntity entity) => RequestDto(
    id: entity.id,
    author: AuthorDto.fromEntity(entity.author),
    conference: ConferenceDto.fromEntity(entity.conference),
    section: SectionDto.fromEntity(entity.section),
    coAuthors: entity.coAuthors,
    title: entity.title,
    status: entity.status,
    comment: entity.comment,
    chat: entity.chat,
    createdAt: entity.createdAt,
  );

  RequestEntity toEntity() => RequestEntity(
    id: id,
    author: author.toEntity(),
    conference: conference.toEntity(),
    section: section.toEntity(),
    coAuthors: coAuthors,
    title: title,
    status: status,
    comment: comment,
    chat: chat,
    createdAt: createdAt,
  );

  RequestCompanion toCompanion() => RequestCompanion(
    id: Value(id),
    authorId: Value(author.id!),
    conferenceId: Value(conference.id!),
    sectionId: Value(section.id),
    coAuthors: Value(coAuthors),
    title: Value(title),
    status: Value(status),
    comment: Value(comment),
    chatId: Value(chat),
    createdAt: Value(createdAt),
  );

  factory RequestDto.fromJson(Map<String, Object> json) => RequestDto(
    id: json['id'] as int,
    author: AuthorDto.fromJson(json['author'] as Map<String, Object>),
    conference: ConferenceDto.fromJson(
      json['conference'] as Map<String, Object>,
    ),
    section: SectionDto.fromJson(json['section'] as Map<String, Object>),
    coAuthors: json['coAuthors'] as String?,
    title: json['title'] as String,
    status: json['status'] as String,
    comment: json['comment'] as String?,
    chat: json['chat'] as int?,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );

  Map<String, Object> toJson() => {
    'id': id,
    'author': author.toJson(),
    'conference': conference.toJson(),
    'section': section.toJson(),
    if (coAuthors != null && coAuthors!.isNotEmpty) 'coAuthors': coAuthors!,
    'title': title,
    'status': status,
    if (comment != null && comment!.isNotEmpty) 'comment': comment!,
    if (chat != null) 'chat': chat!,
    'createdAt': createdAt.toIso8601String(),
  };
}
