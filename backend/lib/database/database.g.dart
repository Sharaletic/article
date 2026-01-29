// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailAddressMeta = const VerificationMeta(
    'emailAddress',
  );
  @override
  late final GeneratedColumn<String> emailAddress = GeneratedColumn<String>(
    'email_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoUrlMeta = const VerificationMeta(
    'photoUrl',
  );
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
    'photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    emailAddress,
    displayName,
    photoUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('email_address')) {
      context.handle(
        _emailAddressMeta,
        emailAddress.isAcceptableOrUnknown(
          data['email_address']!,
          _emailAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_emailAddressMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('photo_url')) {
      context.handle(
        _photoUrlMeta,
        photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      emailAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_address'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String uid;
  final String emailAddress;
  final String? displayName;
  final String? photoUrl;
  const User({
    required this.uid,
    required this.emailAddress,
    this.displayName,
    this.photoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['email_address'] = Variable<String>(emailAddress);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uid: Value(uid),
      emailAddress: Value(emailAddress),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      uid: serializer.fromJson<String>(json['uid']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'displayName': serializer.toJson<String?>(displayName),
      'photoUrl': serializer.toJson<String?>(photoUrl),
    };
  }

  User copyWith({
    String? uid,
    String? emailAddress,
    Value<String?> displayName = const Value.absent(),
    Value<String?> photoUrl = const Value.absent(),
  }) => User(
    uid: uid ?? this.uid,
    emailAddress: emailAddress ?? this.emailAddress,
    displayName: displayName.present ? displayName.value : this.displayName,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      uid: data.uid.present ? data.uid.value : this.uid,
      emailAddress: data.emailAddress.present
          ? data.emailAddress.value
          : this.emailAddress,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('uid: $uid, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, emailAddress, displayName, photoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.uid == this.uid &&
          other.emailAddress == this.emailAddress &&
          other.displayName == this.displayName &&
          other.photoUrl == this.photoUrl);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> uid;
  final Value<String> emailAddress;
  final Value<String?> displayName;
  final Value<String?> photoUrl;
  final Value<int> rowid;
  const UsersCompanion({
    this.uid = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.displayName = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String uid,
    required String emailAddress,
    this.displayName = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       emailAddress = Value(emailAddress);
  static Insertable<User> custom({
    Expression<String>? uid,
    Expression<String>? emailAddress,
    Expression<String>? displayName,
    Expression<String>? photoUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (emailAddress != null) 'email_address': emailAddress,
      if (displayName != null) 'display_name': displayName,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? uid,
    Value<String>? emailAddress,
    Value<String?>? displayName,
    Value<String?>? photoUrl,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      uid: uid ?? this.uid,
      emailAddress: emailAddress ?? this.emailAddress,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('uid: $uid, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuthorsTable extends Authors with TableInfo<$AuthorsTable, Author> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [uid, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Author> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Author map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Author(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $AuthorsTable createAlias(String alias) {
    return $AuthorsTable(attachedDatabase, alias);
  }
}

class Author extends DataClass implements Insertable<Author> {
  final String uid;
  final int id;
  const Author({required this.uid, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['id'] = Variable<int>(id);
    return map;
  }

  AuthorsCompanion toCompanion(bool nullToAbsent) {
    return AuthorsCompanion(uid: Value(uid), id: Value(id));
  }

  factory Author.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Author(
      uid: serializer.fromJson<String>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'id': serializer.toJson<int>(id),
    };
  }

  Author copyWith({String? uid, int? id}) =>
      Author(uid: uid ?? this.uid, id: id ?? this.id);
  Author copyWithCompanion(AuthorsCompanion data) {
    return Author(
      uid: data.uid.present ? data.uid.value : this.uid,
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Author(')
          ..write('uid: $uid, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Author && other.uid == this.uid && other.id == this.id);
}

class AuthorsCompanion extends UpdateCompanion<Author> {
  final Value<String> uid;
  final Value<int> id;
  final Value<int> rowid;
  const AuthorsCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthorsCompanion.insert({
    required String uid,
    required int id,
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       id = Value(id);
  static Insertable<Author> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthorsCompanion copyWith({
    Value<String>? uid,
    Value<int>? id,
    Value<int>? rowid,
  }) {
    return AuthorsCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EditorsTable extends Editors with TableInfo<$EditorsTable, Editor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EditorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [uid, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'editors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Editor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Editor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Editor(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $EditorsTable createAlias(String alias) {
    return $EditorsTable(attachedDatabase, alias);
  }
}

class Editor extends DataClass implements Insertable<Editor> {
  final String uid;
  final int id;
  const Editor({required this.uid, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['id'] = Variable<int>(id);
    return map;
  }

  EditorsCompanion toCompanion(bool nullToAbsent) {
    return EditorsCompanion(uid: Value(uid), id: Value(id));
  }

  factory Editor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Editor(
      uid: serializer.fromJson<String>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'id': serializer.toJson<int>(id),
    };
  }

  Editor copyWith({String? uid, int? id}) =>
      Editor(uid: uid ?? this.uid, id: id ?? this.id);
  Editor copyWithCompanion(EditorsCompanion data) {
    return Editor(
      uid: data.uid.present ? data.uid.value : this.uid,
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Editor(')
          ..write('uid: $uid, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Editor && other.uid == this.uid && other.id == this.id);
}

class EditorsCompanion extends UpdateCompanion<Editor> {
  final Value<String> uid;
  final Value<int> id;
  final Value<int> rowid;
  const EditorsCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EditorsCompanion.insert({
    required String uid,
    required int id,
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       id = Value(id);
  static Insertable<Editor> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EditorsCompanion copyWith({
    Value<String>? uid,
    Value<int>? id,
    Value<int>? rowid,
  }) {
    return EditorsCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EditorsCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewersTable extends Reviewers
    with TableInfo<$ReviewersTable, Reviewer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [uid, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviewers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reviewer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Reviewer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reviewer(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $ReviewersTable createAlias(String alias) {
    return $ReviewersTable(attachedDatabase, alias);
  }
}

class Reviewer extends DataClass implements Insertable<Reviewer> {
  final String uid;
  final int id;
  const Reviewer({required this.uid, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['id'] = Variable<int>(id);
    return map;
  }

  ReviewersCompanion toCompanion(bool nullToAbsent) {
    return ReviewersCompanion(uid: Value(uid), id: Value(id));
  }

  factory Reviewer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reviewer(
      uid: serializer.fromJson<String>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'id': serializer.toJson<int>(id),
    };
  }

  Reviewer copyWith({String? uid, int? id}) =>
      Reviewer(uid: uid ?? this.uid, id: id ?? this.id);
  Reviewer copyWithCompanion(ReviewersCompanion data) {
    return Reviewer(
      uid: data.uid.present ? data.uid.value : this.uid,
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reviewer(')
          ..write('uid: $uid, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reviewer && other.uid == this.uid && other.id == this.id);
}

class ReviewersCompanion extends UpdateCompanion<Reviewer> {
  final Value<String> uid;
  final Value<int> id;
  final Value<int> rowid;
  const ReviewersCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewersCompanion.insert({
    required String uid,
    required int id,
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       id = Value(id);
  static Insertable<Reviewer> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewersCompanion copyWith({
    Value<String>? uid,
    Value<int>? id,
    Value<int>? rowid,
  }) {
    return ReviewersCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewersCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdminTable extends Admin with TableInfo<$AdminTable, AdminData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [uid, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admin';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdminData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AdminData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdminData(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $AdminTable createAlias(String alias) {
    return $AdminTable(attachedDatabase, alias);
  }
}

class AdminData extends DataClass implements Insertable<AdminData> {
  final String uid;
  final int id;
  const AdminData({required this.uid, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['id'] = Variable<int>(id);
    return map;
  }

  AdminCompanion toCompanion(bool nullToAbsent) {
    return AdminCompanion(uid: Value(uid), id: Value(id));
  }

  factory AdminData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdminData(
      uid: serializer.fromJson<String>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'id': serializer.toJson<int>(id),
    };
  }

  AdminData copyWith({String? uid, int? id}) =>
      AdminData(uid: uid ?? this.uid, id: id ?? this.id);
  AdminData copyWithCompanion(AdminCompanion data) {
    return AdminData(
      uid: data.uid.present ? data.uid.value : this.uid,
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdminData(')
          ..write('uid: $uid, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminData && other.uid == this.uid && other.id == this.id);
}

class AdminCompanion extends UpdateCompanion<AdminData> {
  final Value<String> uid;
  final Value<int> id;
  final Value<int> rowid;
  const AdminCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdminCompanion.insert({
    required String uid,
    required int id,
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       id = Value(id);
  static Insertable<AdminData> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdminCompanion copyWith({
    Value<String>? uid,
    Value<int>? id,
    Value<int>? rowid,
  }) {
    return AdminCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConferencesTable extends Conferences
    with TableInfo<$ConferencesTable, Conference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<Conference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Conference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Conference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
    );
  }

  @override
  $ConferencesTable createAlias(String alias) {
    return $ConferencesTable(attachedDatabase, alias);
  }
}

class Conference extends DataClass implements Insertable<Conference> {
  final int id;
  final String title;
  final DateTime endDate;
  const Conference({
    required this.id,
    required this.title,
    required this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['end_date'] = Variable<DateTime>(endDate);
    return map;
  }

  ConferencesCompanion toCompanion(bool nullToAbsent) {
    return ConferencesCompanion(
      id: Value(id),
      title: Value(title),
      endDate: Value(endDate),
    );
  }

  factory Conference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Conference(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'endDate': serializer.toJson<DateTime>(endDate),
    };
  }

  Conference copyWith({int? id, String? title, DateTime? endDate}) =>
      Conference(
        id: id ?? this.id,
        title: title ?? this.title,
        endDate: endDate ?? this.endDate,
      );
  Conference copyWithCompanion(ConferencesCompanion data) {
    return Conference(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Conference(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conference &&
          other.id == this.id &&
          other.title == this.title &&
          other.endDate == this.endDate);
}

class ConferencesCompanion extends UpdateCompanion<Conference> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> endDate;
  const ConferencesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  ConferencesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime endDate,
  }) : title = Value(title),
       endDate = Value(endDate);
  static Insertable<Conference> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (endDate != null) 'end_date': endDate,
    });
  }

  ConferencesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<DateTime>? endDate,
  }) {
    return ConferencesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConferencesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Section> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Section map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Section(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
    );
  }

  @override
  $SectionsTable createAlias(String alias) {
    return $SectionsTable(attachedDatabase, alias);
  }
}

class Section extends DataClass implements Insertable<Section> {
  final int id;
  final String title;
  const Section({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  SectionsCompanion toCompanion(bool nullToAbsent) {
    return SectionsCompanion(id: Value(id), title: Value(title));
  }

  factory Section.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Section(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Section copyWith({int? id, String? title}) =>
      Section(id: id ?? this.id, title: title ?? this.title);
  Section copyWithCompanion(SectionsCompanion data) {
    return Section(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Section(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Section && other.id == this.id && other.title == this.title);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<int> id;
  final Value<String> title;
  const SectionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  SectionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<Section> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  SectionsCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return SectionsCompanion(id: id ?? this.id, title: title ?? this.title);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $ChatsTable extends Chats with TableInfo<$ChatsTable, Chat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _authorIdMeta = const VerificationMeta(
    'authorId',
  );
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
    'author_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES authors (id)',
    ),
  );
  static const VerificationMeta _editorIdMeta = const VerificationMeta(
    'editorId',
  );
  @override
  late final GeneratedColumn<int> editorId = GeneratedColumn<int>(
    'editor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES editors (id)',
    ),
  );
  static const VerificationMeta _reviewerIdMeta = const VerificationMeta(
    'reviewerId',
  );
  @override
  late final GeneratedColumn<int> reviewerId = GeneratedColumn<int>(
    'reviewer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reviewers (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, authorId, editorId, reviewerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chats';
  @override
  VerificationContext validateIntegrity(
    Insertable<Chat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(
        _authorIdMeta,
        authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('editor_id')) {
      context.handle(
        _editorIdMeta,
        editorId.isAcceptableOrUnknown(data['editor_id']!, _editorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_editorIdMeta);
    }
    if (data.containsKey('reviewer_id')) {
      context.handle(
        _reviewerIdMeta,
        reviewerId.isAcceptableOrUnknown(data['reviewer_id']!, _reviewerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chat(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      authorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}author_id'],
      )!,
      editorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}editor_id'],
      )!,
      reviewerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reviewer_id'],
      )!,
    );
  }

  @override
  $ChatsTable createAlias(String alias) {
    return $ChatsTable(attachedDatabase, alias);
  }
}

class Chat extends DataClass implements Insertable<Chat> {
  final int id;
  final int authorId;
  final int editorId;
  final int reviewerId;
  const Chat({
    required this.id,
    required this.authorId,
    required this.editorId,
    required this.reviewerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author_id'] = Variable<int>(authorId);
    map['editor_id'] = Variable<int>(editorId);
    map['reviewer_id'] = Variable<int>(reviewerId);
    return map;
  }

  ChatsCompanion toCompanion(bool nullToAbsent) {
    return ChatsCompanion(
      id: Value(id),
      authorId: Value(authorId),
      editorId: Value(editorId),
      reviewerId: Value(reviewerId),
    );
  }

  factory Chat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chat(
      id: serializer.fromJson<int>(json['id']),
      authorId: serializer.fromJson<int>(json['authorId']),
      editorId: serializer.fromJson<int>(json['editorId']),
      reviewerId: serializer.fromJson<int>(json['reviewerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authorId': serializer.toJson<int>(authorId),
      'editorId': serializer.toJson<int>(editorId),
      'reviewerId': serializer.toJson<int>(reviewerId),
    };
  }

  Chat copyWith({int? id, int? authorId, int? editorId, int? reviewerId}) =>
      Chat(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        editorId: editorId ?? this.editorId,
        reviewerId: reviewerId ?? this.reviewerId,
      );
  Chat copyWithCompanion(ChatsCompanion data) {
    return Chat(
      id: data.id.present ? data.id.value : this.id,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      editorId: data.editorId.present ? data.editorId.value : this.editorId,
      reviewerId: data.reviewerId.present
          ? data.reviewerId.value
          : this.reviewerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chat(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('editorId: $editorId, ')
          ..write('reviewerId: $reviewerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, authorId, editorId, reviewerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chat &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.editorId == this.editorId &&
          other.reviewerId == this.reviewerId);
}

class ChatsCompanion extends UpdateCompanion<Chat> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<int> editorId;
  final Value<int> reviewerId;
  const ChatsCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.editorId = const Value.absent(),
    this.reviewerId = const Value.absent(),
  });
  ChatsCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required int editorId,
    required int reviewerId,
  }) : authorId = Value(authorId),
       editorId = Value(editorId),
       reviewerId = Value(reviewerId);
  static Insertable<Chat> custom({
    Expression<int>? id,
    Expression<int>? authorId,
    Expression<int>? editorId,
    Expression<int>? reviewerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authorId != null) 'author_id': authorId,
      if (editorId != null) 'editor_id': editorId,
      if (reviewerId != null) 'reviewer_id': reviewerId,
    });
  }

  ChatsCompanion copyWith({
    Value<int>? id,
    Value<int>? authorId,
    Value<int>? editorId,
    Value<int>? reviewerId,
  }) {
    return ChatsCompanion(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      editorId: editorId ?? this.editorId,
      reviewerId: reviewerId ?? this.reviewerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (editorId.present) {
      map['editor_id'] = Variable<int>(editorId.value);
    }
    if (reviewerId.present) {
      map['reviewer_id'] = Variable<int>(reviewerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('editorId: $editorId, ')
          ..write('reviewerId: $reviewerId')
          ..write(')'))
        .toString();
  }
}

class $RequestsTable extends Requests with TableInfo<$RequestsTable, Request> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _authorIdMeta = const VerificationMeta(
    'authorId',
  );
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
    'author_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES authors (id)',
    ),
  );
  static const VerificationMeta _conferenceIdMeta = const VerificationMeta(
    'conferenceId',
  );
  @override
  late final GeneratedColumn<int> conferenceId = GeneratedColumn<int>(
    'conference_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES conferences (id)',
    ),
  );
  static const VerificationMeta _sectionIdMeta = const VerificationMeta(
    'sectionId',
  );
  @override
  late final GeneratedColumn<int> sectionId = GeneratedColumn<int>(
    'section_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sections (id)',
    ),
  );
  static const VerificationMeta _coAuthorsMeta = const VerificationMeta(
    'coAuthors',
  );
  @override
  late final GeneratedColumn<String> coAuthors = GeneratedColumn<String>(
    'co_athors',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _articleTitleMeta = const VerificationMeta(
    'articleTitle',
  );
  @override
  late final GeneratedColumn<String> articleTitle = GeneratedColumn<String>(
    'arcticle_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commetMeta = const VerificationMeta('commet');
  @override
  late final GeneratedColumn<String> commet = GeneratedColumn<String>(
    'commet',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<int> chatId = GeneratedColumn<int>(
    'chat_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chats (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    authorId,
    conferenceId,
    sectionId,
    coAuthors,
    articleTitle,
    status,
    commet,
    chatId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<Request> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(
        _authorIdMeta,
        authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('conference_id')) {
      context.handle(
        _conferenceIdMeta,
        conferenceId.isAcceptableOrUnknown(
          data['conference_id']!,
          _conferenceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conferenceIdMeta);
    }
    if (data.containsKey('section_id')) {
      context.handle(
        _sectionIdMeta,
        sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionIdMeta);
    }
    if (data.containsKey('co_athors')) {
      context.handle(
        _coAuthorsMeta,
        coAuthors.isAcceptableOrUnknown(data['co_athors']!, _coAuthorsMeta),
      );
    } else if (isInserting) {
      context.missing(_coAuthorsMeta);
    }
    if (data.containsKey('arcticle_title')) {
      context.handle(
        _articleTitleMeta,
        articleTitle.isAcceptableOrUnknown(
          data['arcticle_title']!,
          _articleTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_articleTitleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('commet')) {
      context.handle(
        _commetMeta,
        commet.isAcceptableOrUnknown(data['commet']!, _commetMeta),
      );
    } else if (isInserting) {
      context.missing(_commetMeta);
    }
    if (data.containsKey('chat_id')) {
      context.handle(
        _chatIdMeta,
        chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Request map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Request(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      authorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}author_id'],
      )!,
      conferenceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}conference_id'],
      )!,
      sectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}section_id'],
      )!,
      coAuthors: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}co_athors'],
      )!,
      articleTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arcticle_title'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      commet: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}commet'],
      )!,
      chatId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chat_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RequestsTable createAlias(String alias) {
    return $RequestsTable(attachedDatabase, alias);
  }
}

class Request extends DataClass implements Insertable<Request> {
  final int id;
  final int authorId;
  final int conferenceId;
  final int sectionId;
  final String coAuthors;
  final String articleTitle;
  final String status;
  final String commet;
  final int chatId;
  final DateTime createdAt;
  const Request({
    required this.id,
    required this.authorId,
    required this.conferenceId,
    required this.sectionId,
    required this.coAuthors,
    required this.articleTitle,
    required this.status,
    required this.commet,
    required this.chatId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author_id'] = Variable<int>(authorId);
    map['conference_id'] = Variable<int>(conferenceId);
    map['section_id'] = Variable<int>(sectionId);
    map['co_athors'] = Variable<String>(coAuthors);
    map['arcticle_title'] = Variable<String>(articleTitle);
    map['status'] = Variable<String>(status);
    map['commet'] = Variable<String>(commet);
    map['chat_id'] = Variable<int>(chatId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RequestsCompanion toCompanion(bool nullToAbsent) {
    return RequestsCompanion(
      id: Value(id),
      authorId: Value(authorId),
      conferenceId: Value(conferenceId),
      sectionId: Value(sectionId),
      coAuthors: Value(coAuthors),
      articleTitle: Value(articleTitle),
      status: Value(status),
      commet: Value(commet),
      chatId: Value(chatId),
      createdAt: Value(createdAt),
    );
  }

  factory Request.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Request(
      id: serializer.fromJson<int>(json['id']),
      authorId: serializer.fromJson<int>(json['authorId']),
      conferenceId: serializer.fromJson<int>(json['conferenceId']),
      sectionId: serializer.fromJson<int>(json['sectionId']),
      coAuthors: serializer.fromJson<String>(json['coAuthors']),
      articleTitle: serializer.fromJson<String>(json['articleTitle']),
      status: serializer.fromJson<String>(json['status']),
      commet: serializer.fromJson<String>(json['commet']),
      chatId: serializer.fromJson<int>(json['chatId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authorId': serializer.toJson<int>(authorId),
      'conferenceId': serializer.toJson<int>(conferenceId),
      'sectionId': serializer.toJson<int>(sectionId),
      'coAuthors': serializer.toJson<String>(coAuthors),
      'articleTitle': serializer.toJson<String>(articleTitle),
      'status': serializer.toJson<String>(status),
      'commet': serializer.toJson<String>(commet),
      'chatId': serializer.toJson<int>(chatId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Request copyWith({
    int? id,
    int? authorId,
    int? conferenceId,
    int? sectionId,
    String? coAuthors,
    String? articleTitle,
    String? status,
    String? commet,
    int? chatId,
    DateTime? createdAt,
  }) => Request(
    id: id ?? this.id,
    authorId: authorId ?? this.authorId,
    conferenceId: conferenceId ?? this.conferenceId,
    sectionId: sectionId ?? this.sectionId,
    coAuthors: coAuthors ?? this.coAuthors,
    articleTitle: articleTitle ?? this.articleTitle,
    status: status ?? this.status,
    commet: commet ?? this.commet,
    chatId: chatId ?? this.chatId,
    createdAt: createdAt ?? this.createdAt,
  );
  Request copyWithCompanion(RequestsCompanion data) {
    return Request(
      id: data.id.present ? data.id.value : this.id,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      conferenceId: data.conferenceId.present
          ? data.conferenceId.value
          : this.conferenceId,
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      coAuthors: data.coAuthors.present ? data.coAuthors.value : this.coAuthors,
      articleTitle: data.articleTitle.present
          ? data.articleTitle.value
          : this.articleTitle,
      status: data.status.present ? data.status.value : this.status,
      commet: data.commet.present ? data.commet.value : this.commet,
      chatId: data.chatId.present ? data.chatId.value : this.chatId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Request(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('conferenceId: $conferenceId, ')
          ..write('sectionId: $sectionId, ')
          ..write('coAuthors: $coAuthors, ')
          ..write('articleTitle: $articleTitle, ')
          ..write('status: $status, ')
          ..write('commet: $commet, ')
          ..write('chatId: $chatId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    authorId,
    conferenceId,
    sectionId,
    coAuthors,
    articleTitle,
    status,
    commet,
    chatId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Request &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.conferenceId == this.conferenceId &&
          other.sectionId == this.sectionId &&
          other.coAuthors == this.coAuthors &&
          other.articleTitle == this.articleTitle &&
          other.status == this.status &&
          other.commet == this.commet &&
          other.chatId == this.chatId &&
          other.createdAt == this.createdAt);
}

class RequestsCompanion extends UpdateCompanion<Request> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<int> conferenceId;
  final Value<int> sectionId;
  final Value<String> coAuthors;
  final Value<String> articleTitle;
  final Value<String> status;
  final Value<String> commet;
  final Value<int> chatId;
  final Value<DateTime> createdAt;
  const RequestsCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.conferenceId = const Value.absent(),
    this.sectionId = const Value.absent(),
    this.coAuthors = const Value.absent(),
    this.articleTitle = const Value.absent(),
    this.status = const Value.absent(),
    this.commet = const Value.absent(),
    this.chatId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RequestsCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required int conferenceId,
    required int sectionId,
    required String coAuthors,
    required String articleTitle,
    required String status,
    required String commet,
    required int chatId,
    required DateTime createdAt,
  }) : authorId = Value(authorId),
       conferenceId = Value(conferenceId),
       sectionId = Value(sectionId),
       coAuthors = Value(coAuthors),
       articleTitle = Value(articleTitle),
       status = Value(status),
       commet = Value(commet),
       chatId = Value(chatId),
       createdAt = Value(createdAt);
  static Insertable<Request> custom({
    Expression<int>? id,
    Expression<int>? authorId,
    Expression<int>? conferenceId,
    Expression<int>? sectionId,
    Expression<String>? coAuthors,
    Expression<String>? articleTitle,
    Expression<String>? status,
    Expression<String>? commet,
    Expression<int>? chatId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authorId != null) 'author_id': authorId,
      if (conferenceId != null) 'conference_id': conferenceId,
      if (sectionId != null) 'section_id': sectionId,
      if (coAuthors != null) 'co_athors': coAuthors,
      if (articleTitle != null) 'arcticle_title': articleTitle,
      if (status != null) 'status': status,
      if (commet != null) 'commet': commet,
      if (chatId != null) 'chat_id': chatId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RequestsCompanion copyWith({
    Value<int>? id,
    Value<int>? authorId,
    Value<int>? conferenceId,
    Value<int>? sectionId,
    Value<String>? coAuthors,
    Value<String>? articleTitle,
    Value<String>? status,
    Value<String>? commet,
    Value<int>? chatId,
    Value<DateTime>? createdAt,
  }) {
    return RequestsCompanion(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      conferenceId: conferenceId ?? this.conferenceId,
      sectionId: sectionId ?? this.sectionId,
      coAuthors: coAuthors ?? this.coAuthors,
      articleTitle: articleTitle ?? this.articleTitle,
      status: status ?? this.status,
      commet: commet ?? this.commet,
      chatId: chatId ?? this.chatId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (conferenceId.present) {
      map['conference_id'] = Variable<int>(conferenceId.value);
    }
    if (sectionId.present) {
      map['section_id'] = Variable<int>(sectionId.value);
    }
    if (coAuthors.present) {
      map['co_athors'] = Variable<String>(coAuthors.value);
    }
    if (articleTitle.present) {
      map['arcticle_title'] = Variable<String>(articleTitle.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (commet.present) {
      map['commet'] = Variable<String>(commet.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<int>(chatId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequestsCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('conferenceId: $conferenceId, ')
          ..write('sectionId: $sectionId, ')
          ..write('coAuthors: $coAuthors, ')
          ..write('articleTitle: $articleTitle, ')
          ..write('status: $status, ')
          ..write('commet: $commet, ')
          ..write('chatId: $chatId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<int> chatId = GeneratedColumn<int>(
    'chat_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chats (id)',
    ),
  );
  static const VerificationMeta _messageTextMeta = const VerificationMeta(
    'messageText',
  );
  @override
  late final GeneratedColumn<String> messageText = GeneratedColumn<String>(
    'message_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, chatId, messageText, uid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Message> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_id')) {
      context.handle(
        _chatIdMeta,
        chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('message_text')) {
      context.handle(
        _messageTextMeta,
        messageText.isAcceptableOrUnknown(
          data['message_text']!,
          _messageTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_messageTextMeta);
    }
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      chatId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chat_id'],
      )!,
      messageText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_text'],
      )!,
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final int id;
  final int chatId;
  final String messageText;
  final String uid;
  const Message({
    required this.id,
    required this.chatId,
    required this.messageText,
    required this.uid,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chat_id'] = Variable<int>(chatId);
    map['message_text'] = Variable<String>(messageText);
    map['uid'] = Variable<String>(uid);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      chatId: Value(chatId),
      messageText: Value(messageText),
      uid: Value(uid),
    );
  }

  factory Message.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      chatId: serializer.fromJson<int>(json['chatId']),
      messageText: serializer.fromJson<String>(json['messageText']),
      uid: serializer.fromJson<String>(json['uid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatId': serializer.toJson<int>(chatId),
      'messageText': serializer.toJson<String>(messageText),
      'uid': serializer.toJson<String>(uid),
    };
  }

  Message copyWith({int? id, int? chatId, String? messageText, String? uid}) =>
      Message(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        messageText: messageText ?? this.messageText,
        uid: uid ?? this.uid,
      );
  Message copyWithCompanion(MessagesCompanion data) {
    return Message(
      id: data.id.present ? data.id.value : this.id,
      chatId: data.chatId.present ? data.chatId.value : this.chatId,
      messageText: data.messageText.present
          ? data.messageText.value
          : this.messageText,
      uid: data.uid.present ? data.uid.value : this.uid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('messageText: $messageText, ')
          ..write('uid: $uid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chatId, messageText, uid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.messageText == this.messageText &&
          other.uid == this.uid);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<int> chatId;
  final Value<String> messageText;
  final Value<String> uid;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.messageText = const Value.absent(),
    this.uid = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    required int chatId,
    required String messageText,
    required String uid,
  }) : chatId = Value(chatId),
       messageText = Value(messageText),
       uid = Value(uid);
  static Insertable<Message> custom({
    Expression<int>? id,
    Expression<int>? chatId,
    Expression<String>? messageText,
    Expression<String>? uid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatId != null) 'chat_id': chatId,
      if (messageText != null) 'message_text': messageText,
      if (uid != null) 'uid': uid,
    });
  }

  MessagesCompanion copyWith({
    Value<int>? id,
    Value<int>? chatId,
    Value<String>? messageText,
    Value<String>? uid,
  }) {
    return MessagesCompanion(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      messageText: messageText ?? this.messageText,
      uid: uid ?? this.uid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<int>(chatId.value);
    }
    if (messageText.present) {
      map['message_text'] = Variable<String>(messageText.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('messageText: $messageText, ')
          ..write('uid: $uid')
          ..write(')'))
        .toString();
  }
}

class $AssigmentsTable extends Assigments
    with TableInfo<$AssigmentsTable, Assigment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssigmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _requestIdMeta = const VerificationMeta(
    'requestId',
  );
  @override
  late final GeneratedColumn<int> requestId = GeneratedColumn<int>(
    'request_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES requests (id)',
    ),
  );
  static const VerificationMeta _editorIdMeta = const VerificationMeta(
    'editorId',
  );
  @override
  late final GeneratedColumn<int> editorId = GeneratedColumn<int>(
    'editor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES editors (id)',
    ),
  );
  static const VerificationMeta _reviewerIdMeta = const VerificationMeta(
    'reviewerId',
  );
  @override
  late final GeneratedColumn<int> reviewerId = GeneratedColumn<int>(
    'reviewer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reviewers (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, requestId, editorId, reviewerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assigments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Assigment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('request_id')) {
      context.handle(
        _requestIdMeta,
        requestId.isAcceptableOrUnknown(data['request_id']!, _requestIdMeta),
      );
    } else if (isInserting) {
      context.missing(_requestIdMeta);
    }
    if (data.containsKey('editor_id')) {
      context.handle(
        _editorIdMeta,
        editorId.isAcceptableOrUnknown(data['editor_id']!, _editorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_editorIdMeta);
    }
    if (data.containsKey('reviewer_id')) {
      context.handle(
        _reviewerIdMeta,
        reviewerId.isAcceptableOrUnknown(data['reviewer_id']!, _reviewerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Assigment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Assigment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      requestId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}request_id'],
      )!,
      editorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}editor_id'],
      )!,
      reviewerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reviewer_id'],
      )!,
    );
  }

  @override
  $AssigmentsTable createAlias(String alias) {
    return $AssigmentsTable(attachedDatabase, alias);
  }
}

class Assigment extends DataClass implements Insertable<Assigment> {
  final int id;
  final int requestId;
  final int editorId;
  final int reviewerId;
  const Assigment({
    required this.id,
    required this.requestId,
    required this.editorId,
    required this.reviewerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['request_id'] = Variable<int>(requestId);
    map['editor_id'] = Variable<int>(editorId);
    map['reviewer_id'] = Variable<int>(reviewerId);
    return map;
  }

  AssigmentsCompanion toCompanion(bool nullToAbsent) {
    return AssigmentsCompanion(
      id: Value(id),
      requestId: Value(requestId),
      editorId: Value(editorId),
      reviewerId: Value(reviewerId),
    );
  }

  factory Assigment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Assigment(
      id: serializer.fromJson<int>(json['id']),
      requestId: serializer.fromJson<int>(json['requestId']),
      editorId: serializer.fromJson<int>(json['editorId']),
      reviewerId: serializer.fromJson<int>(json['reviewerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'requestId': serializer.toJson<int>(requestId),
      'editorId': serializer.toJson<int>(editorId),
      'reviewerId': serializer.toJson<int>(reviewerId),
    };
  }

  Assigment copyWith({
    int? id,
    int? requestId,
    int? editorId,
    int? reviewerId,
  }) => Assigment(
    id: id ?? this.id,
    requestId: requestId ?? this.requestId,
    editorId: editorId ?? this.editorId,
    reviewerId: reviewerId ?? this.reviewerId,
  );
  Assigment copyWithCompanion(AssigmentsCompanion data) {
    return Assigment(
      id: data.id.present ? data.id.value : this.id,
      requestId: data.requestId.present ? data.requestId.value : this.requestId,
      editorId: data.editorId.present ? data.editorId.value : this.editorId,
      reviewerId: data.reviewerId.present
          ? data.reviewerId.value
          : this.reviewerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Assigment(')
          ..write('id: $id, ')
          ..write('requestId: $requestId, ')
          ..write('editorId: $editorId, ')
          ..write('reviewerId: $reviewerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, requestId, editorId, reviewerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Assigment &&
          other.id == this.id &&
          other.requestId == this.requestId &&
          other.editorId == this.editorId &&
          other.reviewerId == this.reviewerId);
}

class AssigmentsCompanion extends UpdateCompanion<Assigment> {
  final Value<int> id;
  final Value<int> requestId;
  final Value<int> editorId;
  final Value<int> reviewerId;
  const AssigmentsCompanion({
    this.id = const Value.absent(),
    this.requestId = const Value.absent(),
    this.editorId = const Value.absent(),
    this.reviewerId = const Value.absent(),
  });
  AssigmentsCompanion.insert({
    this.id = const Value.absent(),
    required int requestId,
    required int editorId,
    required int reviewerId,
  }) : requestId = Value(requestId),
       editorId = Value(editorId),
       reviewerId = Value(reviewerId);
  static Insertable<Assigment> custom({
    Expression<int>? id,
    Expression<int>? requestId,
    Expression<int>? editorId,
    Expression<int>? reviewerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (requestId != null) 'request_id': requestId,
      if (editorId != null) 'editor_id': editorId,
      if (reviewerId != null) 'reviewer_id': reviewerId,
    });
  }

  AssigmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? requestId,
    Value<int>? editorId,
    Value<int>? reviewerId,
  }) {
    return AssigmentsCompanion(
      id: id ?? this.id,
      requestId: requestId ?? this.requestId,
      editorId: editorId ?? this.editorId,
      reviewerId: reviewerId ?? this.reviewerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (requestId.present) {
      map['request_id'] = Variable<int>(requestId.value);
    }
    if (editorId.present) {
      map['editor_id'] = Variable<int>(editorId.value);
    }
    if (reviewerId.present) {
      map['reviewer_id'] = Variable<int>(reviewerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssigmentsCompanion(')
          ..write('id: $id, ')
          ..write('requestId: $requestId, ')
          ..write('editorId: $editorId, ')
          ..write('reviewerId: $reviewerId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AuthorsTable authors = $AuthorsTable(this);
  late final $EditorsTable editors = $EditorsTable(this);
  late final $ReviewersTable reviewers = $ReviewersTable(this);
  late final $AdminTable admin = $AdminTable(this);
  late final $ConferencesTable conferences = $ConferencesTable(this);
  late final $SectionsTable sections = $SectionsTable(this);
  late final $ChatsTable chats = $ChatsTable(this);
  late final $RequestsTable requests = $RequestsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $AssigmentsTable assigments = $AssigmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    authors,
    editors,
    reviewers,
    admin,
    conferences,
    sections,
    chats,
    requests,
    messages,
    assigments,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String uid,
      required String emailAddress,
      Value<String?> displayName,
      Value<String?> photoUrl,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> uid,
      Value<String> emailAddress,
      Value<String?> displayName,
      Value<String?> photoUrl,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AuthorsTable, List<Author>> _authorsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.authors,
    aliasName: $_aliasNameGenerator(db.users.uid, db.authors.uid),
  );

  $$AuthorsTableProcessedTableManager get authorsRefs {
    final manager = $$AuthorsTableTableManager(
      $_db,
      $_db.authors,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_authorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EditorsTable, List<Editor>> _editorsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.editors,
    aliasName: $_aliasNameGenerator(db.users.uid, db.editors.uid),
  );

  $$EditorsTableProcessedTableManager get editorsRefs {
    final manager = $$EditorsTableTableManager(
      $_db,
      $_db.editors,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_editorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReviewersTable, List<Reviewer>>
  _reviewersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reviewers,
    aliasName: $_aliasNameGenerator(db.users.uid, db.reviewers.uid),
  );

  $$ReviewersTableProcessedTableManager get reviewersRefs {
    final manager = $$ReviewersTableTableManager(
      $_db,
      $_db.reviewers,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_reviewersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AdminTable, List<AdminData>> _adminRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.admin,
    aliasName: $_aliasNameGenerator(db.users.uid, db.admin.uid),
  );

  $$AdminTableProcessedTableManager get adminRefs {
    final manager = $$AdminTableTableManager(
      $_db,
      $_db.admin,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_adminRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MessagesTable, List<Message>> _messagesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.messages,
    aliasName: $_aliasNameGenerator(db.users.uid, db.messages.uid),
  );

  $$MessagesTableProcessedTableManager get messagesRefs {
    final manager = $$MessagesTableTableManager(
      $_db,
      $_db.messages,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_messagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> authorsRefs(
    Expression<bool> Function($$AuthorsTableFilterComposer f) f,
  ) {
    final $$AuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableFilterComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> editorsRefs(
    Expression<bool> Function($$EditorsTableFilterComposer f) f,
  ) {
    final $$EditorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableFilterComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reviewersRefs(
    Expression<bool> Function($$ReviewersTableFilterComposer f) f,
  ) {
    final $$ReviewersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableFilterComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> adminRefs(
    Expression<bool> Function($$AdminTableFilterComposer f) f,
  ) {
    final $$AdminTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.admin,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdminTableFilterComposer(
            $db: $db,
            $table: $db.admin,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> messagesRefs(
    Expression<bool> Function($$MessagesTableFilterComposer f) f,
  ) {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableFilterComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  Expression<T> authorsRefs<T extends Object>(
    Expression<T> Function($$AuthorsTableAnnotationComposer a) f,
  ) {
    final $$AuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> editorsRefs<T extends Object>(
    Expression<T> Function($$EditorsTableAnnotationComposer a) f,
  ) {
    final $$EditorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableAnnotationComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reviewersRefs<T extends Object>(
    Expression<T> Function($$ReviewersTableAnnotationComposer a) f,
  ) {
    final $$ReviewersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> adminRefs<T extends Object>(
    Expression<T> Function($$AdminTableAnnotationComposer a) f,
  ) {
    final $$AdminTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.admin,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdminTableAnnotationComposer(
            $db: $db,
            $table: $db.admin,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> messagesRefs<T extends Object>(
    Expression<T> Function($$MessagesTableAnnotationComposer a) f,
  ) {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableAnnotationComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool authorsRefs,
            bool editorsRefs,
            bool reviewersRefs,
            bool adminRefs,
            bool messagesRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                uid: uid,
                emailAddress: emailAddress,
                displayName: displayName,
                photoUrl: photoUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String emailAddress,
                Value<String?> displayName = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                uid: uid,
                emailAddress: emailAddress,
                displayName: displayName,
                photoUrl: photoUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                authorsRefs = false,
                editorsRefs = false,
                reviewersRefs = false,
                adminRefs = false,
                messagesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (authorsRefs) db.authors,
                    if (editorsRefs) db.editors,
                    if (reviewersRefs) db.reviewers,
                    if (adminRefs) db.admin,
                    if (messagesRefs) db.messages,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (authorsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Author>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._authorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).authorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (editorsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Editor>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._editorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).editorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (reviewersRefs)
                        await $_getPrefetchedData<User, $UsersTable, Reviewer>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._reviewersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).reviewersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (adminRefs)
                        await $_getPrefetchedData<User, $UsersTable, AdminData>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._adminRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).adminRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (messagesRefs)
                        await $_getPrefetchedData<User, $UsersTable, Message>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._messagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).messagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool authorsRefs,
        bool editorsRefs,
        bool reviewersRefs,
        bool adminRefs,
        bool messagesRefs,
      })
    >;
typedef $$AuthorsTableCreateCompanionBuilder =
    AuthorsCompanion Function({
      required String uid,
      required int id,
      Value<int> rowid,
    });
typedef $$AuthorsTableUpdateCompanionBuilder =
    AuthorsCompanion Function({
      Value<String> uid,
      Value<int> id,
      Value<int> rowid,
    });

final class $$AuthorsTableReferences
    extends BaseReferences<_$AppDatabase, $AuthorsTable, Author> {
  $$AuthorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _uidTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.authors.uid, db.users.uid));

  $$UsersTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChatsTable, List<Chat>> _chatsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chats,
    aliasName: $_aliasNameGenerator(db.authors.id, db.chats.authorId),
  );

  $$ChatsTableProcessedTableManager get chatsRefs {
    final manager = $$ChatsTableTableManager(
      $_db,
      $_db.chats,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RequestsTable, List<Request>> _requestsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.requests,
    aliasName: $_aliasNameGenerator(db.authors.id, db.requests.authorId),
  );

  $$RequestsTableProcessedTableManager get requestsRefs {
    final manager = $$RequestsTableTableManager(
      $_db,
      $_db.requests,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuthorsTableFilterComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get uid {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> chatsRefs(
    Expression<bool> Function($$ChatsTableFilterComposer f) f,
  ) {
    final $$ChatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableFilterComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> requestsRefs(
    Expression<bool> Function($$RequestsTableFilterComposer f) f,
  ) {
    final $$RequestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableFilterComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get uid {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuthorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UsersTableAnnotationComposer get uid {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> chatsRefs<T extends Object>(
    Expression<T> Function($$ChatsTableAnnotationComposer a) f,
  ) {
    final $$ChatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableAnnotationComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> requestsRefs<T extends Object>(
    Expression<T> Function($$RequestsTableAnnotationComposer a) f,
  ) {
    final $$RequestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableAnnotationComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthorsTable,
          Author,
          $$AuthorsTableFilterComposer,
          $$AuthorsTableOrderingComposer,
          $$AuthorsTableAnnotationComposer,
          $$AuthorsTableCreateCompanionBuilder,
          $$AuthorsTableUpdateCompanionBuilder,
          (Author, $$AuthorsTableReferences),
          Author,
          PrefetchHooks Function({bool uid, bool chatsRefs, bool requestsRefs})
        > {
  $$AuthorsTableTableManager(_$AppDatabase db, $AuthorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuthorsCompanion(uid: uid, id: id, rowid: rowid),
          createCompanionCallback:
              ({
                required String uid,
                required int id,
                Value<int> rowid = const Value.absent(),
              }) => AuthorsCompanion.insert(uid: uid, id: id, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuthorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({uid = false, chatsRefs = false, requestsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (chatsRefs) db.chats,
                    if (requestsRefs) db.requests,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (uid) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.uid,
                                    referencedTable: $$AuthorsTableReferences
                                        ._uidTable(db),
                                    referencedColumn: $$AuthorsTableReferences
                                        ._uidTable(db)
                                        .uid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (chatsRefs)
                        await $_getPrefetchedData<Author, $AuthorsTable, Chat>(
                          currentTable: table,
                          referencedTable: $$AuthorsTableReferences
                              ._chatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AuthorsTableReferences(db, table, p0).chatsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.authorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (requestsRefs)
                        await $_getPrefetchedData<
                          Author,
                          $AuthorsTable,
                          Request
                        >(
                          currentTable: table,
                          referencedTable: $$AuthorsTableReferences
                              ._requestsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AuthorsTableReferences(
                                db,
                                table,
                                p0,
                              ).requestsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.authorId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AuthorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthorsTable,
      Author,
      $$AuthorsTableFilterComposer,
      $$AuthorsTableOrderingComposer,
      $$AuthorsTableAnnotationComposer,
      $$AuthorsTableCreateCompanionBuilder,
      $$AuthorsTableUpdateCompanionBuilder,
      (Author, $$AuthorsTableReferences),
      Author,
      PrefetchHooks Function({bool uid, bool chatsRefs, bool requestsRefs})
    >;
typedef $$EditorsTableCreateCompanionBuilder =
    EditorsCompanion Function({
      required String uid,
      required int id,
      Value<int> rowid,
    });
typedef $$EditorsTableUpdateCompanionBuilder =
    EditorsCompanion Function({
      Value<String> uid,
      Value<int> id,
      Value<int> rowid,
    });

final class $$EditorsTableReferences
    extends BaseReferences<_$AppDatabase, $EditorsTable, Editor> {
  $$EditorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _uidTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.editors.uid, db.users.uid));

  $$UsersTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChatsTable, List<Chat>> _chatsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chats,
    aliasName: $_aliasNameGenerator(db.editors.id, db.chats.editorId),
  );

  $$ChatsTableProcessedTableManager get chatsRefs {
    final manager = $$ChatsTableTableManager(
      $_db,
      $_db.chats,
    ).filter((f) => f.editorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AssigmentsTable, List<Assigment>>
  _assigmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.assigments,
    aliasName: $_aliasNameGenerator(db.editors.id, db.assigments.editorId),
  );

  $$AssigmentsTableProcessedTableManager get assigmentsRefs {
    final manager = $$AssigmentsTableTableManager(
      $_db,
      $_db.assigments,
    ).filter((f) => f.editorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_assigmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EditorsTableFilterComposer
    extends Composer<_$AppDatabase, $EditorsTable> {
  $$EditorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get uid {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> chatsRefs(
    Expression<bool> Function($$ChatsTableFilterComposer f) f,
  ) {
    final $$ChatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.editorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableFilterComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> assigmentsRefs(
    Expression<bool> Function($$AssigmentsTableFilterComposer f) f,
  ) {
    final $$AssigmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assigments,
      getReferencedColumn: (t) => t.editorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssigmentsTableFilterComposer(
            $db: $db,
            $table: $db.assigments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EditorsTableOrderingComposer
    extends Composer<_$AppDatabase, $EditorsTable> {
  $$EditorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get uid {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EditorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EditorsTable> {
  $$EditorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UsersTableAnnotationComposer get uid {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> chatsRefs<T extends Object>(
    Expression<T> Function($$ChatsTableAnnotationComposer a) f,
  ) {
    final $$ChatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.editorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableAnnotationComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> assigmentsRefs<T extends Object>(
    Expression<T> Function($$AssigmentsTableAnnotationComposer a) f,
  ) {
    final $$AssigmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assigments,
      getReferencedColumn: (t) => t.editorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssigmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.assigments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EditorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EditorsTable,
          Editor,
          $$EditorsTableFilterComposer,
          $$EditorsTableOrderingComposer,
          $$EditorsTableAnnotationComposer,
          $$EditorsTableCreateCompanionBuilder,
          $$EditorsTableUpdateCompanionBuilder,
          (Editor, $$EditorsTableReferences),
          Editor,
          PrefetchHooks Function({
            bool uid,
            bool chatsRefs,
            bool assigmentsRefs,
          })
        > {
  $$EditorsTableTableManager(_$AppDatabase db, $EditorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EditorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EditorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EditorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EditorsCompanion(uid: uid, id: id, rowid: rowid),
          createCompanionCallback:
              ({
                required String uid,
                required int id,
                Value<int> rowid = const Value.absent(),
              }) => EditorsCompanion.insert(uid: uid, id: id, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EditorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({uid = false, chatsRefs = false, assigmentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (chatsRefs) db.chats,
                    if (assigmentsRefs) db.assigments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (uid) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.uid,
                                    referencedTable: $$EditorsTableReferences
                                        ._uidTable(db),
                                    referencedColumn: $$EditorsTableReferences
                                        ._uidTable(db)
                                        .uid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (chatsRefs)
                        await $_getPrefetchedData<Editor, $EditorsTable, Chat>(
                          currentTable: table,
                          referencedTable: $$EditorsTableReferences
                              ._chatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EditorsTableReferences(db, table, p0).chatsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.editorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (assigmentsRefs)
                        await $_getPrefetchedData<
                          Editor,
                          $EditorsTable,
                          Assigment
                        >(
                          currentTable: table,
                          referencedTable: $$EditorsTableReferences
                              ._assigmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EditorsTableReferences(
                                db,
                                table,
                                p0,
                              ).assigmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.editorId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EditorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EditorsTable,
      Editor,
      $$EditorsTableFilterComposer,
      $$EditorsTableOrderingComposer,
      $$EditorsTableAnnotationComposer,
      $$EditorsTableCreateCompanionBuilder,
      $$EditorsTableUpdateCompanionBuilder,
      (Editor, $$EditorsTableReferences),
      Editor,
      PrefetchHooks Function({bool uid, bool chatsRefs, bool assigmentsRefs})
    >;
typedef $$ReviewersTableCreateCompanionBuilder =
    ReviewersCompanion Function({
      required String uid,
      required int id,
      Value<int> rowid,
    });
typedef $$ReviewersTableUpdateCompanionBuilder =
    ReviewersCompanion Function({
      Value<String> uid,
      Value<int> id,
      Value<int> rowid,
    });

final class $$ReviewersTableReferences
    extends BaseReferences<_$AppDatabase, $ReviewersTable, Reviewer> {
  $$ReviewersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _uidTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.reviewers.uid, db.users.uid),
  );

  $$UsersTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChatsTable, List<Chat>> _chatsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chats,
    aliasName: $_aliasNameGenerator(db.reviewers.id, db.chats.reviewerId),
  );

  $$ChatsTableProcessedTableManager get chatsRefs {
    final manager = $$ChatsTableTableManager(
      $_db,
      $_db.chats,
    ).filter((f) => f.reviewerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AssigmentsTable, List<Assigment>>
  _assigmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.assigments,
    aliasName: $_aliasNameGenerator(db.reviewers.id, db.assigments.reviewerId),
  );

  $$AssigmentsTableProcessedTableManager get assigmentsRefs {
    final manager = $$AssigmentsTableTableManager(
      $_db,
      $_db.assigments,
    ).filter((f) => f.reviewerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_assigmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReviewersTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewersTable> {
  $$ReviewersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get uid {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> chatsRefs(
    Expression<bool> Function($$ChatsTableFilterComposer f) f,
  ) {
    final $$ChatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.reviewerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableFilterComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> assigmentsRefs(
    Expression<bool> Function($$AssigmentsTableFilterComposer f) f,
  ) {
    final $$AssigmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assigments,
      getReferencedColumn: (t) => t.reviewerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssigmentsTableFilterComposer(
            $db: $db,
            $table: $db.assigments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReviewersTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewersTable> {
  $$ReviewersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get uid {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewersTable> {
  $$ReviewersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UsersTableAnnotationComposer get uid {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> chatsRefs<T extends Object>(
    Expression<T> Function($$ChatsTableAnnotationComposer a) f,
  ) {
    final $$ChatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.reviewerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableAnnotationComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> assigmentsRefs<T extends Object>(
    Expression<T> Function($$AssigmentsTableAnnotationComposer a) f,
  ) {
    final $$AssigmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assigments,
      getReferencedColumn: (t) => t.reviewerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssigmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.assigments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReviewersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewersTable,
          Reviewer,
          $$ReviewersTableFilterComposer,
          $$ReviewersTableOrderingComposer,
          $$ReviewersTableAnnotationComposer,
          $$ReviewersTableCreateCompanionBuilder,
          $$ReviewersTableUpdateCompanionBuilder,
          (Reviewer, $$ReviewersTableReferences),
          Reviewer,
          PrefetchHooks Function({
            bool uid,
            bool chatsRefs,
            bool assigmentsRefs,
          })
        > {
  $$ReviewersTableTableManager(_$AppDatabase db, $ReviewersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewersCompanion(uid: uid, id: id, rowid: rowid),
          createCompanionCallback:
              ({
                required String uid,
                required int id,
                Value<int> rowid = const Value.absent(),
              }) => ReviewersCompanion.insert(uid: uid, id: id, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReviewersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({uid = false, chatsRefs = false, assigmentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (chatsRefs) db.chats,
                    if (assigmentsRefs) db.assigments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (uid) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.uid,
                                    referencedTable: $$ReviewersTableReferences
                                        ._uidTable(db),
                                    referencedColumn: $$ReviewersTableReferences
                                        ._uidTable(db)
                                        .uid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (chatsRefs)
                        await $_getPrefetchedData<
                          Reviewer,
                          $ReviewersTable,
                          Chat
                        >(
                          currentTable: table,
                          referencedTable: $$ReviewersTableReferences
                              ._chatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReviewersTableReferences(
                                db,
                                table,
                                p0,
                              ).chatsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reviewerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (assigmentsRefs)
                        await $_getPrefetchedData<
                          Reviewer,
                          $ReviewersTable,
                          Assigment
                        >(
                          currentTable: table,
                          referencedTable: $$ReviewersTableReferences
                              ._assigmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReviewersTableReferences(
                                db,
                                table,
                                p0,
                              ).assigmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reviewerId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ReviewersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewersTable,
      Reviewer,
      $$ReviewersTableFilterComposer,
      $$ReviewersTableOrderingComposer,
      $$ReviewersTableAnnotationComposer,
      $$ReviewersTableCreateCompanionBuilder,
      $$ReviewersTableUpdateCompanionBuilder,
      (Reviewer, $$ReviewersTableReferences),
      Reviewer,
      PrefetchHooks Function({bool uid, bool chatsRefs, bool assigmentsRefs})
    >;
typedef $$AdminTableCreateCompanionBuilder =
    AdminCompanion Function({
      required String uid,
      required int id,
      Value<int> rowid,
    });
typedef $$AdminTableUpdateCompanionBuilder =
    AdminCompanion Function({
      Value<String> uid,
      Value<int> id,
      Value<int> rowid,
    });

final class $$AdminTableReferences
    extends BaseReferences<_$AppDatabase, $AdminTable, AdminData> {
  $$AdminTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _uidTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.admin.uid, db.users.uid));

  $$UsersTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AdminTableFilterComposer extends Composer<_$AppDatabase, $AdminTable> {
  $$AdminTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get uid {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdminTableOrderingComposer
    extends Composer<_$AppDatabase, $AdminTable> {
  $$AdminTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get uid {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdminTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdminTable> {
  $$AdminTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UsersTableAnnotationComposer get uid {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdminTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdminTable,
          AdminData,
          $$AdminTableFilterComposer,
          $$AdminTableOrderingComposer,
          $$AdminTableAnnotationComposer,
          $$AdminTableCreateCompanionBuilder,
          $$AdminTableUpdateCompanionBuilder,
          (AdminData, $$AdminTableReferences),
          AdminData,
          PrefetchHooks Function({bool uid})
        > {
  $$AdminTableTableManager(_$AppDatabase db, $AdminTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdminTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdminTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdminTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdminCompanion(uid: uid, id: id, rowid: rowid),
          createCompanionCallback:
              ({
                required String uid,
                required int id,
                Value<int> rowid = const Value.absent(),
              }) => AdminCompanion.insert(uid: uid, id: id, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AdminTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({uid = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (uid) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.uid,
                                referencedTable: $$AdminTableReferences
                                    ._uidTable(db),
                                referencedColumn: $$AdminTableReferences
                                    ._uidTable(db)
                                    .uid,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AdminTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdminTable,
      AdminData,
      $$AdminTableFilterComposer,
      $$AdminTableOrderingComposer,
      $$AdminTableAnnotationComposer,
      $$AdminTableCreateCompanionBuilder,
      $$AdminTableUpdateCompanionBuilder,
      (AdminData, $$AdminTableReferences),
      AdminData,
      PrefetchHooks Function({bool uid})
    >;
typedef $$ConferencesTableCreateCompanionBuilder =
    ConferencesCompanion Function({
      Value<int> id,
      required String title,
      required DateTime endDate,
    });
typedef $$ConferencesTableUpdateCompanionBuilder =
    ConferencesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<DateTime> endDate,
    });

final class $$ConferencesTableReferences
    extends BaseReferences<_$AppDatabase, $ConferencesTable, Conference> {
  $$ConferencesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RequestsTable, List<Request>> _requestsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.requests,
    aliasName: $_aliasNameGenerator(
      db.conferences.id,
      db.requests.conferenceId,
    ),
  );

  $$RequestsTableProcessedTableManager get requestsRefs {
    final manager = $$RequestsTableTableManager(
      $_db,
      $_db.requests,
    ).filter((f) => f.conferenceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConferencesTableFilterComposer
    extends Composer<_$AppDatabase, $ConferencesTable> {
  $$ConferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> requestsRefs(
    Expression<bool> Function($$RequestsTableFilterComposer f) f,
  ) {
    final $$RequestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.conferenceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableFilterComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $ConferencesTable> {
  $$ConferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConferencesTable> {
  $$ConferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  Expression<T> requestsRefs<T extends Object>(
    Expression<T> Function($$RequestsTableAnnotationComposer a) f,
  ) {
    final $$RequestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.conferenceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableAnnotationComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConferencesTable,
          Conference,
          $$ConferencesTableFilterComposer,
          $$ConferencesTableOrderingComposer,
          $$ConferencesTableAnnotationComposer,
          $$ConferencesTableCreateCompanionBuilder,
          $$ConferencesTableUpdateCompanionBuilder,
          (Conference, $$ConferencesTableReferences),
          Conference,
          PrefetchHooks Function({bool requestsRefs})
        > {
  $$ConferencesTableTableManager(_$AppDatabase db, $ConferencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
              }) =>
                  ConferencesCompanion(id: id, title: title, endDate: endDate),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required DateTime endDate,
              }) => ConferencesCompanion.insert(
                id: id,
                title: title,
                endDate: endDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConferencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({requestsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (requestsRefs) db.requests],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (requestsRefs)
                    await $_getPrefetchedData<
                      Conference,
                      $ConferencesTable,
                      Request
                    >(
                      currentTable: table,
                      referencedTable: $$ConferencesTableReferences
                          ._requestsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ConferencesTableReferences(
                            db,
                            table,
                            p0,
                          ).requestsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.conferenceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ConferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConferencesTable,
      Conference,
      $$ConferencesTableFilterComposer,
      $$ConferencesTableOrderingComposer,
      $$ConferencesTableAnnotationComposer,
      $$ConferencesTableCreateCompanionBuilder,
      $$ConferencesTableUpdateCompanionBuilder,
      (Conference, $$ConferencesTableReferences),
      Conference,
      PrefetchHooks Function({bool requestsRefs})
    >;
typedef $$SectionsTableCreateCompanionBuilder =
    SectionsCompanion Function({Value<int> id, required String title});
typedef $$SectionsTableUpdateCompanionBuilder =
    SectionsCompanion Function({Value<int> id, Value<String> title});

final class $$SectionsTableReferences
    extends BaseReferences<_$AppDatabase, $SectionsTable, Section> {
  $$SectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RequestsTable, List<Request>> _requestsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.requests,
    aliasName: $_aliasNameGenerator(db.sections.id, db.requests.sectionId),
  );

  $$RequestsTableProcessedTableManager get requestsRefs {
    final manager = $$RequestsTableTableManager(
      $_db,
      $_db.requests,
    ).filter((f) => f.sectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SectionsTableFilterComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> requestsRefs(
    Expression<bool> Function($$RequestsTableFilterComposer f) f,
  ) {
    final $$RequestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.sectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableFilterComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> requestsRefs<T extends Object>(
    Expression<T> Function($$RequestsTableAnnotationComposer a) f,
  ) {
    final $$RequestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.sectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableAnnotationComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SectionsTable,
          Section,
          $$SectionsTableFilterComposer,
          $$SectionsTableOrderingComposer,
          $$SectionsTableAnnotationComposer,
          $$SectionsTableCreateCompanionBuilder,
          $$SectionsTableUpdateCompanionBuilder,
          (Section, $$SectionsTableReferences),
          Section,
          PrefetchHooks Function({bool requestsRefs})
        > {
  $$SectionsTableTableManager(_$AppDatabase db, $SectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
              }) => SectionsCompanion(id: id, title: title),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String title}) =>
                  SectionsCompanion.insert(id: id, title: title),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({requestsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (requestsRefs) db.requests],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (requestsRefs)
                    await $_getPrefetchedData<Section, $SectionsTable, Request>(
                      currentTable: table,
                      referencedTable: $$SectionsTableReferences
                          ._requestsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SectionsTableReferences(db, table, p0).requestsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sectionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SectionsTable,
      Section,
      $$SectionsTableFilterComposer,
      $$SectionsTableOrderingComposer,
      $$SectionsTableAnnotationComposer,
      $$SectionsTableCreateCompanionBuilder,
      $$SectionsTableUpdateCompanionBuilder,
      (Section, $$SectionsTableReferences),
      Section,
      PrefetchHooks Function({bool requestsRefs})
    >;
typedef $$ChatsTableCreateCompanionBuilder =
    ChatsCompanion Function({
      Value<int> id,
      required int authorId,
      required int editorId,
      required int reviewerId,
    });
typedef $$ChatsTableUpdateCompanionBuilder =
    ChatsCompanion Function({
      Value<int> id,
      Value<int> authorId,
      Value<int> editorId,
      Value<int> reviewerId,
    });

final class $$ChatsTableReferences
    extends BaseReferences<_$AppDatabase, $ChatsTable, Chat> {
  $$ChatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuthorsTable _authorIdTable(_$AppDatabase db) => db.authors
      .createAlias($_aliasNameGenerator(db.chats.authorId, db.authors.id));

  $$AuthorsTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager = $$AuthorsTableTableManager(
      $_db,
      $_db.authors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EditorsTable _editorIdTable(_$AppDatabase db) => db.editors
      .createAlias($_aliasNameGenerator(db.chats.editorId, db.editors.id));

  $$EditorsTableProcessedTableManager get editorId {
    final $_column = $_itemColumn<int>('editor_id')!;

    final manager = $$EditorsTableTableManager(
      $_db,
      $_db.editors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_editorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ReviewersTable _reviewerIdTable(_$AppDatabase db) => db.reviewers
      .createAlias($_aliasNameGenerator(db.chats.reviewerId, db.reviewers.id));

  $$ReviewersTableProcessedTableManager get reviewerId {
    final $_column = $_itemColumn<int>('reviewer_id')!;

    final manager = $$ReviewersTableTableManager(
      $_db,
      $_db.reviewers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reviewerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RequestsTable, List<Request>> _requestsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.requests,
    aliasName: $_aliasNameGenerator(db.chats.id, db.requests.chatId),
  );

  $$RequestsTableProcessedTableManager get requestsRefs {
    final manager = $$RequestsTableTableManager(
      $_db,
      $_db.requests,
    ).filter((f) => f.chatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MessagesTable, List<Message>> _messagesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.messages,
    aliasName: $_aliasNameGenerator(db.chats.id, db.messages.chatId),
  );

  $$MessagesTableProcessedTableManager get messagesRefs {
    final manager = $$MessagesTableTableManager(
      $_db,
      $_db.messages,
    ).filter((f) => f.chatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChatsTableFilterComposer extends Composer<_$AppDatabase, $ChatsTable> {
  $$ChatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$AuthorsTableFilterComposer get authorId {
    final $$AuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableFilterComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorsTableFilterComposer get editorId {
    final $$EditorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableFilterComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewersTableFilterComposer get reviewerId {
    final $$ReviewersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableFilterComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> requestsRefs(
    Expression<bool> Function($$RequestsTableFilterComposer f) f,
  ) {
    final $$RequestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableFilterComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> messagesRefs(
    Expression<bool> Function($$MessagesTableFilterComposer f) f,
  ) {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableFilterComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChatsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatsTable> {
  $$ChatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$AuthorsTableOrderingComposer get authorId {
    final $$AuthorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableOrderingComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorsTableOrderingComposer get editorId {
    final $$EditorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableOrderingComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewersTableOrderingComposer get reviewerId {
    final $$ReviewersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableOrderingComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatsTable> {
  $$ChatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$AuthorsTableAnnotationComposer get authorId {
    final $$AuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorsTableAnnotationComposer get editorId {
    final $$EditorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableAnnotationComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewersTableAnnotationComposer get reviewerId {
    final $$ReviewersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> requestsRefs<T extends Object>(
    Expression<T> Function($$RequestsTableAnnotationComposer a) f,
  ) {
    final $$RequestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableAnnotationComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> messagesRefs<T extends Object>(
    Expression<T> Function($$MessagesTableAnnotationComposer a) f,
  ) {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableAnnotationComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatsTable,
          Chat,
          $$ChatsTableFilterComposer,
          $$ChatsTableOrderingComposer,
          $$ChatsTableAnnotationComposer,
          $$ChatsTableCreateCompanionBuilder,
          $$ChatsTableUpdateCompanionBuilder,
          (Chat, $$ChatsTableReferences),
          Chat,
          PrefetchHooks Function({
            bool authorId,
            bool editorId,
            bool reviewerId,
            bool requestsRefs,
            bool messagesRefs,
          })
        > {
  $$ChatsTableTableManager(_$AppDatabase db, $ChatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> authorId = const Value.absent(),
                Value<int> editorId = const Value.absent(),
                Value<int> reviewerId = const Value.absent(),
              }) => ChatsCompanion(
                id: id,
                authorId: authorId,
                editorId: editorId,
                reviewerId: reviewerId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int authorId,
                required int editorId,
                required int reviewerId,
              }) => ChatsCompanion.insert(
                id: id,
                authorId: authorId,
                editorId: editorId,
                reviewerId: reviewerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ChatsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                authorId = false,
                editorId = false,
                reviewerId = false,
                requestsRefs = false,
                messagesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (requestsRefs) db.requests,
                    if (messagesRefs) db.messages,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (authorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.authorId,
                                    referencedTable: $$ChatsTableReferences
                                        ._authorIdTable(db),
                                    referencedColumn: $$ChatsTableReferences
                                        ._authorIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (editorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.editorId,
                                    referencedTable: $$ChatsTableReferences
                                        ._editorIdTable(db),
                                    referencedColumn: $$ChatsTableReferences
                                        ._editorIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (reviewerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.reviewerId,
                                    referencedTable: $$ChatsTableReferences
                                        ._reviewerIdTable(db),
                                    referencedColumn: $$ChatsTableReferences
                                        ._reviewerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (requestsRefs)
                        await $_getPrefetchedData<Chat, $ChatsTable, Request>(
                          currentTable: table,
                          referencedTable: $$ChatsTableReferences
                              ._requestsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChatsTableReferences(
                                db,
                                table,
                                p0,
                              ).requestsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.chatId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (messagesRefs)
                        await $_getPrefetchedData<Chat, $ChatsTable, Message>(
                          currentTable: table,
                          referencedTable: $$ChatsTableReferences
                              ._messagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChatsTableReferences(
                                db,
                                table,
                                p0,
                              ).messagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.chatId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ChatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatsTable,
      Chat,
      $$ChatsTableFilterComposer,
      $$ChatsTableOrderingComposer,
      $$ChatsTableAnnotationComposer,
      $$ChatsTableCreateCompanionBuilder,
      $$ChatsTableUpdateCompanionBuilder,
      (Chat, $$ChatsTableReferences),
      Chat,
      PrefetchHooks Function({
        bool authorId,
        bool editorId,
        bool reviewerId,
        bool requestsRefs,
        bool messagesRefs,
      })
    >;
typedef $$RequestsTableCreateCompanionBuilder =
    RequestsCompanion Function({
      Value<int> id,
      required int authorId,
      required int conferenceId,
      required int sectionId,
      required String coAuthors,
      required String articleTitle,
      required String status,
      required String commet,
      required int chatId,
      required DateTime createdAt,
    });
typedef $$RequestsTableUpdateCompanionBuilder =
    RequestsCompanion Function({
      Value<int> id,
      Value<int> authorId,
      Value<int> conferenceId,
      Value<int> sectionId,
      Value<String> coAuthors,
      Value<String> articleTitle,
      Value<String> status,
      Value<String> commet,
      Value<int> chatId,
      Value<DateTime> createdAt,
    });

final class $$RequestsTableReferences
    extends BaseReferences<_$AppDatabase, $RequestsTable, Request> {
  $$RequestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuthorsTable _authorIdTable(_$AppDatabase db) => db.authors
      .createAlias($_aliasNameGenerator(db.requests.authorId, db.authors.id));

  $$AuthorsTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager = $$AuthorsTableTableManager(
      $_db,
      $_db.authors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ConferencesTable _conferenceIdTable(_$AppDatabase db) =>
      db.conferences.createAlias(
        $_aliasNameGenerator(db.requests.conferenceId, db.conferences.id),
      );

  $$ConferencesTableProcessedTableManager get conferenceId {
    final $_column = $_itemColumn<int>('conference_id')!;

    final manager = $$ConferencesTableTableManager(
      $_db,
      $_db.conferences,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_conferenceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SectionsTable _sectionIdTable(_$AppDatabase db) => db.sections
      .createAlias($_aliasNameGenerator(db.requests.sectionId, db.sections.id));

  $$SectionsTableProcessedTableManager get sectionId {
    final $_column = $_itemColumn<int>('section_id')!;

    final manager = $$SectionsTableTableManager(
      $_db,
      $_db.sections,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChatsTable _chatIdTable(_$AppDatabase db) => db.chats.createAlias(
    $_aliasNameGenerator(db.requests.chatId, db.chats.id),
  );

  $$ChatsTableProcessedTableManager get chatId {
    final $_column = $_itemColumn<int>('chat_id')!;

    final manager = $$ChatsTableTableManager(
      $_db,
      $_db.chats,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AssigmentsTable, List<Assigment>>
  _assigmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.assigments,
    aliasName: $_aliasNameGenerator(db.requests.id, db.assigments.requestId),
  );

  $$AssigmentsTableProcessedTableManager get assigmentsRefs {
    final manager = $$AssigmentsTableTableManager(
      $_db,
      $_db.assigments,
    ).filter((f) => f.requestId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_assigmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RequestsTableFilterComposer
    extends Composer<_$AppDatabase, $RequestsTable> {
  $$RequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coAuthors => $composableBuilder(
    column: $table.coAuthors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commet => $composableBuilder(
    column: $table.commet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AuthorsTableFilterComposer get authorId {
    final $$AuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableFilterComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConferencesTableFilterComposer get conferenceId {
    final $$ConferencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conferenceId,
      referencedTable: $db.conferences,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConferencesTableFilterComposer(
            $db: $db,
            $table: $db.conferences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SectionsTableFilterComposer get sectionId {
    final $$SectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.sections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionsTableFilterComposer(
            $db: $db,
            $table: $db.sections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChatsTableFilterComposer get chatId {
    final $$ChatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableFilterComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> assigmentsRefs(
    Expression<bool> Function($$AssigmentsTableFilterComposer f) f,
  ) {
    final $$AssigmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assigments,
      getReferencedColumn: (t) => t.requestId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssigmentsTableFilterComposer(
            $db: $db,
            $table: $db.assigments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $RequestsTable> {
  $$RequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coAuthors => $composableBuilder(
    column: $table.coAuthors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commet => $composableBuilder(
    column: $table.commet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AuthorsTableOrderingComposer get authorId {
    final $$AuthorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableOrderingComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConferencesTableOrderingComposer get conferenceId {
    final $$ConferencesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conferenceId,
      referencedTable: $db.conferences,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConferencesTableOrderingComposer(
            $db: $db,
            $table: $db.conferences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SectionsTableOrderingComposer get sectionId {
    final $$SectionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.sections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionsTableOrderingComposer(
            $db: $db,
            $table: $db.sections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChatsTableOrderingComposer get chatId {
    final $$ChatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableOrderingComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RequestsTable> {
  $$RequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get coAuthors =>
      $composableBuilder(column: $table.coAuthors, builder: (column) => column);

  GeneratedColumn<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get commet =>
      $composableBuilder(column: $table.commet, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AuthorsTableAnnotationComposer get authorId {
    final $$AuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConferencesTableAnnotationComposer get conferenceId {
    final $$ConferencesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conferenceId,
      referencedTable: $db.conferences,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConferencesTableAnnotationComposer(
            $db: $db,
            $table: $db.conferences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SectionsTableAnnotationComposer get sectionId {
    final $$SectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.sections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChatsTableAnnotationComposer get chatId {
    final $$ChatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableAnnotationComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> assigmentsRefs<T extends Object>(
    Expression<T> Function($$AssigmentsTableAnnotationComposer a) f,
  ) {
    final $$AssigmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assigments,
      getReferencedColumn: (t) => t.requestId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssigmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.assigments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RequestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RequestsTable,
          Request,
          $$RequestsTableFilterComposer,
          $$RequestsTableOrderingComposer,
          $$RequestsTableAnnotationComposer,
          $$RequestsTableCreateCompanionBuilder,
          $$RequestsTableUpdateCompanionBuilder,
          (Request, $$RequestsTableReferences),
          Request,
          PrefetchHooks Function({
            bool authorId,
            bool conferenceId,
            bool sectionId,
            bool chatId,
            bool assigmentsRefs,
          })
        > {
  $$RequestsTableTableManager(_$AppDatabase db, $RequestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> authorId = const Value.absent(),
                Value<int> conferenceId = const Value.absent(),
                Value<int> sectionId = const Value.absent(),
                Value<String> coAuthors = const Value.absent(),
                Value<String> articleTitle = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> commet = const Value.absent(),
                Value<int> chatId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RequestsCompanion(
                id: id,
                authorId: authorId,
                conferenceId: conferenceId,
                sectionId: sectionId,
                coAuthors: coAuthors,
                articleTitle: articleTitle,
                status: status,
                commet: commet,
                chatId: chatId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int authorId,
                required int conferenceId,
                required int sectionId,
                required String coAuthors,
                required String articleTitle,
                required String status,
                required String commet,
                required int chatId,
                required DateTime createdAt,
              }) => RequestsCompanion.insert(
                id: id,
                authorId: authorId,
                conferenceId: conferenceId,
                sectionId: sectionId,
                coAuthors: coAuthors,
                articleTitle: articleTitle,
                status: status,
                commet: commet,
                chatId: chatId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RequestsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                authorId = false,
                conferenceId = false,
                sectionId = false,
                chatId = false,
                assigmentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (assigmentsRefs) db.assigments],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (authorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.authorId,
                                    referencedTable: $$RequestsTableReferences
                                        ._authorIdTable(db),
                                    referencedColumn: $$RequestsTableReferences
                                        ._authorIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (conferenceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.conferenceId,
                                    referencedTable: $$RequestsTableReferences
                                        ._conferenceIdTable(db),
                                    referencedColumn: $$RequestsTableReferences
                                        ._conferenceIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (sectionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sectionId,
                                    referencedTable: $$RequestsTableReferences
                                        ._sectionIdTable(db),
                                    referencedColumn: $$RequestsTableReferences
                                        ._sectionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (chatId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.chatId,
                                    referencedTable: $$RequestsTableReferences
                                        ._chatIdTable(db),
                                    referencedColumn: $$RequestsTableReferences
                                        ._chatIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (assigmentsRefs)
                        await $_getPrefetchedData<
                          Request,
                          $RequestsTable,
                          Assigment
                        >(
                          currentTable: table,
                          referencedTable: $$RequestsTableReferences
                              ._assigmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RequestsTableReferences(
                                db,
                                table,
                                p0,
                              ).assigmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.requestId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RequestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RequestsTable,
      Request,
      $$RequestsTableFilterComposer,
      $$RequestsTableOrderingComposer,
      $$RequestsTableAnnotationComposer,
      $$RequestsTableCreateCompanionBuilder,
      $$RequestsTableUpdateCompanionBuilder,
      (Request, $$RequestsTableReferences),
      Request,
      PrefetchHooks Function({
        bool authorId,
        bool conferenceId,
        bool sectionId,
        bool chatId,
        bool assigmentsRefs,
      })
    >;
typedef $$MessagesTableCreateCompanionBuilder =
    MessagesCompanion Function({
      Value<int> id,
      required int chatId,
      required String messageText,
      required String uid,
    });
typedef $$MessagesTableUpdateCompanionBuilder =
    MessagesCompanion Function({
      Value<int> id,
      Value<int> chatId,
      Value<String> messageText,
      Value<String> uid,
    });

final class $$MessagesTableReferences
    extends BaseReferences<_$AppDatabase, $MessagesTable, Message> {
  $$MessagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChatsTable _chatIdTable(_$AppDatabase db) => db.chats.createAlias(
    $_aliasNameGenerator(db.messages.chatId, db.chats.id),
  );

  $$ChatsTableProcessedTableManager get chatId {
    final $_column = $_itemColumn<int>('chat_id')!;

    final manager = $$ChatsTableTableManager(
      $_db,
      $_db.chats,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _uidTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.messages.uid, db.users.uid));

  $$UsersTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MessagesTableFilterComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => ColumnFilters(column),
  );

  $$ChatsTableFilterComposer get chatId {
    final $$ChatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableFilterComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get uid {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChatsTableOrderingComposer get chatId {
    final $$ChatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableOrderingComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get uid {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => column,
  );

  $$ChatsTableAnnotationComposer get chatId {
    final $$ChatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatsTableAnnotationComposer(
            $db: $db,
            $table: $db.chats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get uid {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MessagesTable,
          Message,
          $$MessagesTableFilterComposer,
          $$MessagesTableOrderingComposer,
          $$MessagesTableAnnotationComposer,
          $$MessagesTableCreateCompanionBuilder,
          $$MessagesTableUpdateCompanionBuilder,
          (Message, $$MessagesTableReferences),
          Message,
          PrefetchHooks Function({bool chatId, bool uid})
        > {
  $$MessagesTableTableManager(_$AppDatabase db, $MessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> chatId = const Value.absent(),
                Value<String> messageText = const Value.absent(),
                Value<String> uid = const Value.absent(),
              }) => MessagesCompanion(
                id: id,
                chatId: chatId,
                messageText: messageText,
                uid: uid,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int chatId,
                required String messageText,
                required String uid,
              }) => MessagesCompanion.insert(
                id: id,
                chatId: chatId,
                messageText: messageText,
                uid: uid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MessagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({chatId = false, uid = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (chatId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.chatId,
                                referencedTable: $$MessagesTableReferences
                                    ._chatIdTable(db),
                                referencedColumn: $$MessagesTableReferences
                                    ._chatIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (uid) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.uid,
                                referencedTable: $$MessagesTableReferences
                                    ._uidTable(db),
                                referencedColumn: $$MessagesTableReferences
                                    ._uidTable(db)
                                    .uid,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MessagesTable,
      Message,
      $$MessagesTableFilterComposer,
      $$MessagesTableOrderingComposer,
      $$MessagesTableAnnotationComposer,
      $$MessagesTableCreateCompanionBuilder,
      $$MessagesTableUpdateCompanionBuilder,
      (Message, $$MessagesTableReferences),
      Message,
      PrefetchHooks Function({bool chatId, bool uid})
    >;
typedef $$AssigmentsTableCreateCompanionBuilder =
    AssigmentsCompanion Function({
      Value<int> id,
      required int requestId,
      required int editorId,
      required int reviewerId,
    });
typedef $$AssigmentsTableUpdateCompanionBuilder =
    AssigmentsCompanion Function({
      Value<int> id,
      Value<int> requestId,
      Value<int> editorId,
      Value<int> reviewerId,
    });

final class $$AssigmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AssigmentsTable, Assigment> {
  $$AssigmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RequestsTable _requestIdTable(_$AppDatabase db) =>
      db.requests.createAlias(
        $_aliasNameGenerator(db.assigments.requestId, db.requests.id),
      );

  $$RequestsTableProcessedTableManager get requestId {
    final $_column = $_itemColumn<int>('request_id')!;

    final manager = $$RequestsTableTableManager(
      $_db,
      $_db.requests,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_requestIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EditorsTable _editorIdTable(_$AppDatabase db) => db.editors
      .createAlias($_aliasNameGenerator(db.assigments.editorId, db.editors.id));

  $$EditorsTableProcessedTableManager get editorId {
    final $_column = $_itemColumn<int>('editor_id')!;

    final manager = $$EditorsTableTableManager(
      $_db,
      $_db.editors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_editorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ReviewersTable _reviewerIdTable(_$AppDatabase db) =>
      db.reviewers.createAlias(
        $_aliasNameGenerator(db.assigments.reviewerId, db.reviewers.id),
      );

  $$ReviewersTableProcessedTableManager get reviewerId {
    final $_column = $_itemColumn<int>('reviewer_id')!;

    final manager = $$ReviewersTableTableManager(
      $_db,
      $_db.reviewers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reviewerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AssigmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AssigmentsTable> {
  $$AssigmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$RequestsTableFilterComposer get requestId {
    final $$RequestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableFilterComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorsTableFilterComposer get editorId {
    final $$EditorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableFilterComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewersTableFilterComposer get reviewerId {
    final $$ReviewersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableFilterComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssigmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssigmentsTable> {
  $$AssigmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$RequestsTableOrderingComposer get requestId {
    final $$RequestsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableOrderingComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorsTableOrderingComposer get editorId {
    final $$EditorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableOrderingComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewersTableOrderingComposer get reviewerId {
    final $$ReviewersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableOrderingComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssigmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssigmentsTable> {
  $$AssigmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$RequestsTableAnnotationComposer get requestId {
    final $$RequestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.requests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestsTableAnnotationComposer(
            $db: $db,
            $table: $db.requests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorsTableAnnotationComposer get editorId {
    final $$EditorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorsTableAnnotationComposer(
            $db: $db,
            $table: $db.editors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewersTableAnnotationComposer get reviewerId {
    final $$ReviewersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewersTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssigmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssigmentsTable,
          Assigment,
          $$AssigmentsTableFilterComposer,
          $$AssigmentsTableOrderingComposer,
          $$AssigmentsTableAnnotationComposer,
          $$AssigmentsTableCreateCompanionBuilder,
          $$AssigmentsTableUpdateCompanionBuilder,
          (Assigment, $$AssigmentsTableReferences),
          Assigment,
          PrefetchHooks Function({
            bool requestId,
            bool editorId,
            bool reviewerId,
          })
        > {
  $$AssigmentsTableTableManager(_$AppDatabase db, $AssigmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssigmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssigmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssigmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> requestId = const Value.absent(),
                Value<int> editorId = const Value.absent(),
                Value<int> reviewerId = const Value.absent(),
              }) => AssigmentsCompanion(
                id: id,
                requestId: requestId,
                editorId: editorId,
                reviewerId: reviewerId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int requestId,
                required int editorId,
                required int reviewerId,
              }) => AssigmentsCompanion.insert(
                id: id,
                requestId: requestId,
                editorId: editorId,
                reviewerId: reviewerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AssigmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({requestId = false, editorId = false, reviewerId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (requestId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.requestId,
                                    referencedTable: $$AssigmentsTableReferences
                                        ._requestIdTable(db),
                                    referencedColumn:
                                        $$AssigmentsTableReferences
                                            ._requestIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (editorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.editorId,
                                    referencedTable: $$AssigmentsTableReferences
                                        ._editorIdTable(db),
                                    referencedColumn:
                                        $$AssigmentsTableReferences
                                            ._editorIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (reviewerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.reviewerId,
                                    referencedTable: $$AssigmentsTableReferences
                                        ._reviewerIdTable(db),
                                    referencedColumn:
                                        $$AssigmentsTableReferences
                                            ._reviewerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AssigmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssigmentsTable,
      Assigment,
      $$AssigmentsTableFilterComposer,
      $$AssigmentsTableOrderingComposer,
      $$AssigmentsTableAnnotationComposer,
      $$AssigmentsTableCreateCompanionBuilder,
      $$AssigmentsTableUpdateCompanionBuilder,
      (Assigment, $$AssigmentsTableReferences),
      Assigment,
      PrefetchHooks Function({bool requestId, bool editorId, bool reviewerId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AuthorsTableTableManager get authors =>
      $$AuthorsTableTableManager(_db, _db.authors);
  $$EditorsTableTableManager get editors =>
      $$EditorsTableTableManager(_db, _db.editors);
  $$ReviewersTableTableManager get reviewers =>
      $$ReviewersTableTableManager(_db, _db.reviewers);
  $$AdminTableTableManager get admin =>
      $$AdminTableTableManager(_db, _db.admin);
  $$ConferencesTableTableManager get conferences =>
      $$ConferencesTableTableManager(_db, _db.conferences);
  $$SectionsTableTableManager get sections =>
      $$SectionsTableTableManager(_db, _db.sections);
  $$ChatsTableTableManager get chats =>
      $$ChatsTableTableManager(_db, _db.chats);
  $$RequestsTableTableManager get requests =>
      $$RequestsTableTableManager(_db, _db.requests);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$AssigmentsTableTableManager get assigments =>
      $$AssigmentsTableTableManager(_db, _db.assigments);
}
