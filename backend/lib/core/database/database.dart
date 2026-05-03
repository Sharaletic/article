import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';

import '../../features/author/author.dart';
import '../../features/conference/conference.dart';
part 'database.g.dart';

class User extends Table {
  TextColumn get uid => text()();
  TextColumn get emailAddress => text().named('email_address')();
  TextColumn get role => text()();
  TextColumn get displayName => text().named('display_name')();
  TextColumn get photoUrl => text().named('photo_url').nullable()();
}

class Author extends Table {
  TextColumn get uid => text().references(User, #uid)();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get status => text()();
  TextColumn get lastNameRu => text().named('last_name_ru')();
  TextColumn get lastNameEn => text().named('last_name_en')();
  TextColumn get firstNameRu => text().named('first_name_ru')();
  TextColumn get firstNameEn => text().named('first_name_en')();
  TextColumn get middleNameRu => text().named('middle_name_ru').nullable()();
  TextColumn get middleNameEn => text().named('middle_name_en').nullable()();
  IntColumn get organizationId =>
      integer().named('organization_id').references(Organization, #id)();
  TextColumn get educationLevel => text().named('education_level').nullable()();
  TextColumn get posts => text().map(PostConverter()).nullable()();
  TextColumn get academicDegree => text().named('academic_degree').nullable()();
  TextColumn get academicTitle => text().named('academic_title').nullable()();
}

class Editor extends Table {
  TextColumn get uid => text().references(User, #uid)();
  IntColumn get id => integer().autoIncrement()();
}

class Reviewer extends Table {
  TextColumn get uid => text().references(User, #uid)();
  IntColumn get id => integer().autoIncrement()();
}

class Admin extends Table {
  TextColumn get uid => text().references(User, #uid)();
  IntColumn get id => integer().autoIncrement()();
}

class Organization extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get titleRu => text().named('title_ru')();
  TextColumn get titleEn => text().named('title_en')();
}

class Request extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get authorId =>
      integer().named('author_id').references(Author, #id)();
  IntColumn get conferenceId =>
      integer().named('conference_id').references(Conference, #id)();
  IntColumn get sectionId =>
      integer().named('section_id').references(Section, #id)();
  TextColumn get coAuthors => text().named('co_athors').nullable()();
  TextColumn get title => text().named('title')();
  TextColumn get status => text()();
  TextColumn get comment => text().nullable()();
  IntColumn get chatId =>
      integer().named('chat_id').references(Chat, #id).nullable()();
  Column<DateTime> get createdAt => dateTime()();
}

class Conference extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get titleNormalized => text()();
  TextColumn get shortDescription => text().named('short_description')();
  Column<DateTime> get startConferenceDate =>
      dateTime().named('start_conference_date')();
  Column<DateTime> get endConferenceDate =>
      dateTime().named('end_conference_date').nullable()();
  TextColumn get address => text()();
  TextColumn get conferenceFormat => text()
      .named('conference_format')
      .map(ConferenceFormatConverter())
      .nullable()();
  Column<DateTime> get submissionStartDate =>
      dateTime().named('submission_start_date')();
  Column<DateTime> get submissionEndDate =>
      dateTime().named('submission_end_date')();
  IntColumn get quantityOfPages => integer().named('quantity_of_pages')();
  TextColumn get fileFormat =>
      text().named('file_format').map(FileFormatConverter()).nullable()();
  TextColumn get requirements => text()();
}

class Section extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

class Chat extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get authorId =>
      integer().named('author_id').references(Author, #id)();
  IntColumn get editorId =>
      integer().named('editor_id').references(Editor, #id)();
  IntColumn get reviewerId =>
      integer().named('reviewer_id').references(Reviewer, #id)();
}

class Message extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chatId => integer().named('chat_id').references(Chat, #id)();
  TextColumn get messageText => text().named('message_text')();
  TextColumn get uid => text().references(User, #uid)();
}

class RequestReviewersEditorsAssigment extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get requestId =>
      integer().named('request_id').references(Request, #id)();
  IntColumn get editorId =>
      integer().named('editor_id').references(Editor, #id)();
  IntColumn get reviewerId =>
      integer().named('reviewer_id').references(Reviewer, #id)();
}

@DriftDatabase(
  tables: [
    User,
    Author,
    Editor,
    Reviewer,
    Admin,
    Organization,
    Request,
    Conference,
    Section,
    Chat,
    Message,
    RequestReviewersEditorsAssigment,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.createInBackground(
      File(
        '/Users/vadimlyamin/Development/arcticle_app/backend/bin/app_database',
      ),
    );
  }
}
