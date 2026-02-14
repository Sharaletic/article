import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
part 'database.g.dart';

class Users extends Table {
  TextColumn get uid => text()();
  TextColumn get emailAddress => text().named('email_address')();
  TextColumn get role => text()();
  TextColumn get displayName => text().named('display_name')();
  TextColumn get photoUrl => text().named('photo_url').nullable()();
}

class Authors extends Table {
  TextColumn get uid => text().references(Users, #uid)();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lastNameRu => text().named('last_name_ru')();
  TextColumn get lastNameEn => text().named('last_name_en')();
  TextColumn get firstNameRu => text().named('first_name_ru')();
  TextColumn get firstNameEn => text().named('first_name_en')();
  TextColumn get middleNameRu => text().named('middle_name_ru').nullable()();
  TextColumn get middleNameEn => text().named('middle_name_en').nullable()();
  IntColumn get organizationId => integer().named('organization_id')();
  TextColumn get educationLevel => text().named('education_level').nullable()();
  TextColumn get post => text().nullable()();
  TextColumn get academicDegree => text().named('academic_degree').nullable()();
  TextColumn get academicTitle => text().named('academic_title').nullable()();
}

class Editors extends Table {
  TextColumn get uid => text().references(Users, #uid)();
  IntColumn get id => integer().autoIncrement()();
}

class Reviewers extends Table {
  TextColumn get uid => text().references(Users, #uid)();
  IntColumn get id => integer().autoIncrement()();
}

class Admin extends Table {
  TextColumn get uid => text().references(Users, #uid)();
  IntColumn get id => integer().autoIncrement()();
}

class Requests extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get authorId =>
      integer().named('author_id').references(Authors, #id)();
  IntColumn get conferenceId =>
      integer().named('conference_id').references(Conferences, #id)();
  IntColumn get sectionId =>
      integer().named('section_id').references(Sections, #id)();
  TextColumn get coAuthors => text().named('co_athors')();
  TextColumn get articleTitle => text().named('arcticle_title')();
  TextColumn get status => text()();
  TextColumn get commet => text()();
  IntColumn get chatId => integer().named('chat_id').references(Chats, #id)();
  Column<DateTime> get createdAt => dateTime()();
}

class Conferences extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  Column<DateTime> get endDate => dateTime().named('end_date')();
}

class Sections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

class Chats extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get authorId =>
      integer().named('author_id').references(Authors, #id)();
  IntColumn get editorId =>
      integer().named('editor_id').references(Editors, #id)();
  IntColumn get reviewerId =>
      integer().named('reviewer_id').references(Reviewers, #id)();
}

class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chatId => integer().named('chat_id').references(Chats, #id)();
  TextColumn get messageText => text().named('message_text')();
  TextColumn get uid => text().references(Users, #uid)();
}

class Assigments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get requestId =>
      integer().named('request_id').references(Requests, #id)();
  IntColumn get editorId =>
      integer().named('editor_id').references(Editors, #id)();
  IntColumn get reviewerId =>
      integer().named('reviewer_id').references(Reviewers, #id)();
}

@DriftDatabase(
  tables: [
    Users,
    Authors,
    Editors,
    Reviewers,
    Admin,
    Requests,
    Conferences,
    Sections,
    Chats,
    Messages,
    Assigments,
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
