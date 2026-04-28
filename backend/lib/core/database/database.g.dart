// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    role,
    displayName,
    photoUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserData> instance, {
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
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
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
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      emailAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_address'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String uid;
  final String emailAddress;
  final String role;
  final String displayName;
  final String? photoUrl;
  const UserData({
    required this.uid,
    required this.emailAddress,
    required this.role,
    required this.displayName,
    this.photoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['email_address'] = Variable<String>(emailAddress);
    map['role'] = Variable<String>(role);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      uid: Value(uid),
      emailAddress: Value(emailAddress),
      role: Value(role),
      displayName: Value(displayName),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
    );
  }

  factory UserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      uid: serializer.fromJson<String>(json['uid']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      role: serializer.fromJson<String>(json['role']),
      displayName: serializer.fromJson<String>(json['displayName']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'role': serializer.toJson<String>(role),
      'displayName': serializer.toJson<String>(displayName),
      'photoUrl': serializer.toJson<String?>(photoUrl),
    };
  }

  UserData copyWith({
    String? uid,
    String? emailAddress,
    String? role,
    String? displayName,
    Value<String?> photoUrl = const Value.absent(),
  }) => UserData(
    uid: uid ?? this.uid,
    emailAddress: emailAddress ?? this.emailAddress,
    role: role ?? this.role,
    displayName: displayName ?? this.displayName,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
  );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      uid: data.uid.present ? data.uid.value : this.uid,
      emailAddress: data.emailAddress.present
          ? data.emailAddress.value
          : this.emailAddress,
      role: data.role.present ? data.role.value : this.role,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('uid: $uid, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('role: $role, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uid, emailAddress, role, displayName, photoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.uid == this.uid &&
          other.emailAddress == this.emailAddress &&
          other.role == this.role &&
          other.displayName == this.displayName &&
          other.photoUrl == this.photoUrl);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> uid;
  final Value<String> emailAddress;
  final Value<String> role;
  final Value<String> displayName;
  final Value<String?> photoUrl;
  final Value<int> rowid;
  const UserCompanion({
    this.uid = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.role = const Value.absent(),
    this.displayName = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    required String uid,
    required String emailAddress,
    required String role,
    required String displayName,
    this.photoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       emailAddress = Value(emailAddress),
       role = Value(role),
       displayName = Value(displayName);
  static Insertable<UserData> custom({
    Expression<String>? uid,
    Expression<String>? emailAddress,
    Expression<String>? role,
    Expression<String>? displayName,
    Expression<String>? photoUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (emailAddress != null) 'email_address': emailAddress,
      if (role != null) 'role': role,
      if (displayName != null) 'display_name': displayName,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith({
    Value<String>? uid,
    Value<String>? emailAddress,
    Value<String>? role,
    Value<String>? displayName,
    Value<String?>? photoUrl,
    Value<int>? rowid,
  }) {
    return UserCompanion(
      uid: uid ?? this.uid,
      emailAddress: emailAddress ?? this.emailAddress,
      role: role ?? this.role,
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
    if (role.present) {
      map['role'] = Variable<String>(role.value);
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
    return (StringBuffer('UserCompanion(')
          ..write('uid: $uid, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('role: $role, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrganizationTable extends Organization
    with TableInfo<$OrganizationTable, OrganizationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleRuMeta = const VerificationMeta(
    'titleRu',
  );
  @override
  late final GeneratedColumn<String> titleRu = GeneratedColumn<String>(
    'title_ru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleEnMeta = const VerificationMeta(
    'titleEn',
  );
  @override
  late final GeneratedColumn<String> titleEn = GeneratedColumn<String>(
    'title_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, titleRu, titleEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organization';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrganizationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title_ru')) {
      context.handle(
        _titleRuMeta,
        titleRu.isAcceptableOrUnknown(data['title_ru']!, _titleRuMeta),
      );
    } else if (isInserting) {
      context.missing(_titleRuMeta);
    }
    if (data.containsKey('title_en')) {
      context.handle(
        _titleEnMeta,
        titleEn.isAcceptableOrUnknown(data['title_en']!, _titleEnMeta),
      );
    } else if (isInserting) {
      context.missing(_titleEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrganizationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizationData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      titleRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_ru'],
      )!,
      titleEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_en'],
      )!,
    );
  }

  @override
  $OrganizationTable createAlias(String alias) {
    return $OrganizationTable(attachedDatabase, alias);
  }
}

class OrganizationData extends DataClass
    implements Insertable<OrganizationData> {
  final int id;
  final String titleRu;
  final String titleEn;
  const OrganizationData({
    required this.id,
    required this.titleRu,
    required this.titleEn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title_ru'] = Variable<String>(titleRu);
    map['title_en'] = Variable<String>(titleEn);
    return map;
  }

  OrganizationCompanion toCompanion(bool nullToAbsent) {
    return OrganizationCompanion(
      id: Value(id),
      titleRu: Value(titleRu),
      titleEn: Value(titleEn),
    );
  }

  factory OrganizationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizationData(
      id: serializer.fromJson<int>(json['id']),
      titleRu: serializer.fromJson<String>(json['titleRu']),
      titleEn: serializer.fromJson<String>(json['titleEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'titleRu': serializer.toJson<String>(titleRu),
      'titleEn': serializer.toJson<String>(titleEn),
    };
  }

  OrganizationData copyWith({int? id, String? titleRu, String? titleEn}) =>
      OrganizationData(
        id: id ?? this.id,
        titleRu: titleRu ?? this.titleRu,
        titleEn: titleEn ?? this.titleEn,
      );
  OrganizationData copyWithCompanion(OrganizationCompanion data) {
    return OrganizationData(
      id: data.id.present ? data.id.value : this.id,
      titleRu: data.titleRu.present ? data.titleRu.value : this.titleRu,
      titleEn: data.titleEn.present ? data.titleEn.value : this.titleEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationData(')
          ..write('id: $id, ')
          ..write('titleRu: $titleRu, ')
          ..write('titleEn: $titleEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, titleRu, titleEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationData &&
          other.id == this.id &&
          other.titleRu == this.titleRu &&
          other.titleEn == this.titleEn);
}

class OrganizationCompanion extends UpdateCompanion<OrganizationData> {
  final Value<int> id;
  final Value<String> titleRu;
  final Value<String> titleEn;
  const OrganizationCompanion({
    this.id = const Value.absent(),
    this.titleRu = const Value.absent(),
    this.titleEn = const Value.absent(),
  });
  OrganizationCompanion.insert({
    this.id = const Value.absent(),
    required String titleRu,
    required String titleEn,
  }) : titleRu = Value(titleRu),
       titleEn = Value(titleEn);
  static Insertable<OrganizationData> custom({
    Expression<int>? id,
    Expression<String>? titleRu,
    Expression<String>? titleEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titleRu != null) 'title_ru': titleRu,
      if (titleEn != null) 'title_en': titleEn,
    });
  }

  OrganizationCompanion copyWith({
    Value<int>? id,
    Value<String>? titleRu,
    Value<String>? titleEn,
  }) {
    return OrganizationCompanion(
      id: id ?? this.id,
      titleRu: titleRu ?? this.titleRu,
      titleEn: titleEn ?? this.titleEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (titleRu.present) {
      map['title_ru'] = Variable<String>(titleRu.value);
    }
    if (titleEn.present) {
      map['title_en'] = Variable<String>(titleEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationCompanion(')
          ..write('id: $id, ')
          ..write('titleRu: $titleRu, ')
          ..write('titleEn: $titleEn')
          ..write(')'))
        .toString();
  }
}

class $AuthorTable extends Author with TableInfo<$AuthorTable, AuthorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (uid)',
    ),
  );
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameRuMeta = const VerificationMeta(
    'lastNameRu',
  );
  @override
  late final GeneratedColumn<String> lastNameRu = GeneratedColumn<String>(
    'last_name_ru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameEnMeta = const VerificationMeta(
    'lastNameEn',
  );
  @override
  late final GeneratedColumn<String> lastNameEn = GeneratedColumn<String>(
    'last_name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstNameRuMeta = const VerificationMeta(
    'firstNameRu',
  );
  @override
  late final GeneratedColumn<String> firstNameRu = GeneratedColumn<String>(
    'first_name_ru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstNameEnMeta = const VerificationMeta(
    'firstNameEn',
  );
  @override
  late final GeneratedColumn<String> firstNameEn = GeneratedColumn<String>(
    'first_name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _middleNameRuMeta = const VerificationMeta(
    'middleNameRu',
  );
  @override
  late final GeneratedColumn<String> middleNameRu = GeneratedColumn<String>(
    'middle_name_ru',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _middleNameEnMeta = const VerificationMeta(
    'middleNameEn',
  );
  @override
  late final GeneratedColumn<String> middleNameEn = GeneratedColumn<String>(
    'middle_name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<int> organizationId = GeneratedColumn<int>(
    'organization_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES organization (id)',
    ),
  );
  static const VerificationMeta _educationLevelMeta = const VerificationMeta(
    'educationLevel',
  );
  @override
  late final GeneratedColumn<String> educationLevel = GeneratedColumn<String>(
    'education_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<Post>?, String> posts =
      GeneratedColumn<String>(
        'posts',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<Post>?>($AuthorTable.$converterposts);
  static const VerificationMeta _academicDegreeMeta = const VerificationMeta(
    'academicDegree',
  );
  @override
  late final GeneratedColumn<String> academicDegree = GeneratedColumn<String>(
    'academic_degree',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academicTitleMeta = const VerificationMeta(
    'academicTitle',
  );
  @override
  late final GeneratedColumn<String> academicTitle = GeneratedColumn<String>(
    'academic_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    id,
    status,
    lastNameRu,
    lastNameEn,
    firstNameRu,
    firstNameEn,
    middleNameRu,
    middleNameEn,
    organizationId,
    educationLevel,
    posts,
    academicDegree,
    academicTitle,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'author';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthorData> instance, {
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
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('last_name_ru')) {
      context.handle(
        _lastNameRuMeta,
        lastNameRu.isAcceptableOrUnknown(
          data['last_name_ru']!,
          _lastNameRuMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastNameRuMeta);
    }
    if (data.containsKey('last_name_en')) {
      context.handle(
        _lastNameEnMeta,
        lastNameEn.isAcceptableOrUnknown(
          data['last_name_en']!,
          _lastNameEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastNameEnMeta);
    }
    if (data.containsKey('first_name_ru')) {
      context.handle(
        _firstNameRuMeta,
        firstNameRu.isAcceptableOrUnknown(
          data['first_name_ru']!,
          _firstNameRuMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstNameRuMeta);
    }
    if (data.containsKey('first_name_en')) {
      context.handle(
        _firstNameEnMeta,
        firstNameEn.isAcceptableOrUnknown(
          data['first_name_en']!,
          _firstNameEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstNameEnMeta);
    }
    if (data.containsKey('middle_name_ru')) {
      context.handle(
        _middleNameRuMeta,
        middleNameRu.isAcceptableOrUnknown(
          data['middle_name_ru']!,
          _middleNameRuMeta,
        ),
      );
    }
    if (data.containsKey('middle_name_en')) {
      context.handle(
        _middleNameEnMeta,
        middleNameEn.isAcceptableOrUnknown(
          data['middle_name_en']!,
          _middleNameEnMeta,
        ),
      );
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_organizationIdMeta);
    }
    if (data.containsKey('education_level')) {
      context.handle(
        _educationLevelMeta,
        educationLevel.isAcceptableOrUnknown(
          data['education_level']!,
          _educationLevelMeta,
        ),
      );
    }
    if (data.containsKey('academic_degree')) {
      context.handle(
        _academicDegreeMeta,
        academicDegree.isAcceptableOrUnknown(
          data['academic_degree']!,
          _academicDegreeMeta,
        ),
      );
    }
    if (data.containsKey('academic_title')) {
      context.handle(
        _academicTitleMeta,
        academicTitle.isAcceptableOrUnknown(
          data['academic_title']!,
          _academicTitleMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthorData(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      lastNameRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name_ru'],
      )!,
      lastNameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name_en'],
      )!,
      firstNameRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name_ru'],
      )!,
      firstNameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name_en'],
      )!,
      middleNameRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}middle_name_ru'],
      ),
      middleNameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}middle_name_en'],
      ),
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}organization_id'],
      )!,
      educationLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}education_level'],
      ),
      posts: $AuthorTable.$converterposts.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}posts'],
        ),
      ),
      academicDegree: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academic_degree'],
      ),
      academicTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academic_title'],
      ),
    );
  }

  @override
  $AuthorTable createAlias(String alias) {
    return $AuthorTable(attachedDatabase, alias);
  }

  static TypeConverter<List<Post>?, String?> $converterposts = PostConverter();
}

class AuthorData extends DataClass implements Insertable<AuthorData> {
  final String uid;
  final int id;
  final String status;
  final String lastNameRu;
  final String lastNameEn;
  final String firstNameRu;
  final String firstNameEn;
  final String? middleNameRu;
  final String? middleNameEn;
  final int organizationId;
  final String? educationLevel;
  final List<Post>? posts;
  final String? academicDegree;
  final String? academicTitle;
  const AuthorData({
    required this.uid,
    required this.id,
    required this.status,
    required this.lastNameRu,
    required this.lastNameEn,
    required this.firstNameRu,
    required this.firstNameEn,
    this.middleNameRu,
    this.middleNameEn,
    required this.organizationId,
    this.educationLevel,
    this.posts,
    this.academicDegree,
    this.academicTitle,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['id'] = Variable<int>(id);
    map['status'] = Variable<String>(status);
    map['last_name_ru'] = Variable<String>(lastNameRu);
    map['last_name_en'] = Variable<String>(lastNameEn);
    map['first_name_ru'] = Variable<String>(firstNameRu);
    map['first_name_en'] = Variable<String>(firstNameEn);
    if (!nullToAbsent || middleNameRu != null) {
      map['middle_name_ru'] = Variable<String>(middleNameRu);
    }
    if (!nullToAbsent || middleNameEn != null) {
      map['middle_name_en'] = Variable<String>(middleNameEn);
    }
    map['organization_id'] = Variable<int>(organizationId);
    if (!nullToAbsent || educationLevel != null) {
      map['education_level'] = Variable<String>(educationLevel);
    }
    if (!nullToAbsent || posts != null) {
      map['posts'] = Variable<String>(
        $AuthorTable.$converterposts.toSql(posts),
      );
    }
    if (!nullToAbsent || academicDegree != null) {
      map['academic_degree'] = Variable<String>(academicDegree);
    }
    if (!nullToAbsent || academicTitle != null) {
      map['academic_title'] = Variable<String>(academicTitle);
    }
    return map;
  }

  AuthorCompanion toCompanion(bool nullToAbsent) {
    return AuthorCompanion(
      uid: Value(uid),
      id: Value(id),
      status: Value(status),
      lastNameRu: Value(lastNameRu),
      lastNameEn: Value(lastNameEn),
      firstNameRu: Value(firstNameRu),
      firstNameEn: Value(firstNameEn),
      middleNameRu: middleNameRu == null && nullToAbsent
          ? const Value.absent()
          : Value(middleNameRu),
      middleNameEn: middleNameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(middleNameEn),
      organizationId: Value(organizationId),
      educationLevel: educationLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(educationLevel),
      posts: posts == null && nullToAbsent
          ? const Value.absent()
          : Value(posts),
      academicDegree: academicDegree == null && nullToAbsent
          ? const Value.absent()
          : Value(academicDegree),
      academicTitle: academicTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(academicTitle),
    );
  }

  factory AuthorData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthorData(
      uid: serializer.fromJson<String>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
      status: serializer.fromJson<String>(json['status']),
      lastNameRu: serializer.fromJson<String>(json['lastNameRu']),
      lastNameEn: serializer.fromJson<String>(json['lastNameEn']),
      firstNameRu: serializer.fromJson<String>(json['firstNameRu']),
      firstNameEn: serializer.fromJson<String>(json['firstNameEn']),
      middleNameRu: serializer.fromJson<String?>(json['middleNameRu']),
      middleNameEn: serializer.fromJson<String?>(json['middleNameEn']),
      organizationId: serializer.fromJson<int>(json['organizationId']),
      educationLevel: serializer.fromJson<String?>(json['educationLevel']),
      posts: serializer.fromJson<List<Post>?>(json['posts']),
      academicDegree: serializer.fromJson<String?>(json['academicDegree']),
      academicTitle: serializer.fromJson<String?>(json['academicTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'id': serializer.toJson<int>(id),
      'status': serializer.toJson<String>(status),
      'lastNameRu': serializer.toJson<String>(lastNameRu),
      'lastNameEn': serializer.toJson<String>(lastNameEn),
      'firstNameRu': serializer.toJson<String>(firstNameRu),
      'firstNameEn': serializer.toJson<String>(firstNameEn),
      'middleNameRu': serializer.toJson<String?>(middleNameRu),
      'middleNameEn': serializer.toJson<String?>(middleNameEn),
      'organizationId': serializer.toJson<int>(organizationId),
      'educationLevel': serializer.toJson<String?>(educationLevel),
      'posts': serializer.toJson<List<Post>?>(posts),
      'academicDegree': serializer.toJson<String?>(academicDegree),
      'academicTitle': serializer.toJson<String?>(academicTitle),
    };
  }

  AuthorData copyWith({
    String? uid,
    int? id,
    String? status,
    String? lastNameRu,
    String? lastNameEn,
    String? firstNameRu,
    String? firstNameEn,
    Value<String?> middleNameRu = const Value.absent(),
    Value<String?> middleNameEn = const Value.absent(),
    int? organizationId,
    Value<String?> educationLevel = const Value.absent(),
    Value<List<Post>?> posts = const Value.absent(),
    Value<String?> academicDegree = const Value.absent(),
    Value<String?> academicTitle = const Value.absent(),
  }) => AuthorData(
    uid: uid ?? this.uid,
    id: id ?? this.id,
    status: status ?? this.status,
    lastNameRu: lastNameRu ?? this.lastNameRu,
    lastNameEn: lastNameEn ?? this.lastNameEn,
    firstNameRu: firstNameRu ?? this.firstNameRu,
    firstNameEn: firstNameEn ?? this.firstNameEn,
    middleNameRu: middleNameRu.present ? middleNameRu.value : this.middleNameRu,
    middleNameEn: middleNameEn.present ? middleNameEn.value : this.middleNameEn,
    organizationId: organizationId ?? this.organizationId,
    educationLevel: educationLevel.present
        ? educationLevel.value
        : this.educationLevel,
    posts: posts.present ? posts.value : this.posts,
    academicDegree: academicDegree.present
        ? academicDegree.value
        : this.academicDegree,
    academicTitle: academicTitle.present
        ? academicTitle.value
        : this.academicTitle,
  );
  AuthorData copyWithCompanion(AuthorCompanion data) {
    return AuthorData(
      uid: data.uid.present ? data.uid.value : this.uid,
      id: data.id.present ? data.id.value : this.id,
      status: data.status.present ? data.status.value : this.status,
      lastNameRu: data.lastNameRu.present
          ? data.lastNameRu.value
          : this.lastNameRu,
      lastNameEn: data.lastNameEn.present
          ? data.lastNameEn.value
          : this.lastNameEn,
      firstNameRu: data.firstNameRu.present
          ? data.firstNameRu.value
          : this.firstNameRu,
      firstNameEn: data.firstNameEn.present
          ? data.firstNameEn.value
          : this.firstNameEn,
      middleNameRu: data.middleNameRu.present
          ? data.middleNameRu.value
          : this.middleNameRu,
      middleNameEn: data.middleNameEn.present
          ? data.middleNameEn.value
          : this.middleNameEn,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      educationLevel: data.educationLevel.present
          ? data.educationLevel.value
          : this.educationLevel,
      posts: data.posts.present ? data.posts.value : this.posts,
      academicDegree: data.academicDegree.present
          ? data.academicDegree.value
          : this.academicDegree,
      academicTitle: data.academicTitle.present
          ? data.academicTitle.value
          : this.academicTitle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthorData(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('lastNameRu: $lastNameRu, ')
          ..write('lastNameEn: $lastNameEn, ')
          ..write('firstNameRu: $firstNameRu, ')
          ..write('firstNameEn: $firstNameEn, ')
          ..write('middleNameRu: $middleNameRu, ')
          ..write('middleNameEn: $middleNameEn, ')
          ..write('organizationId: $organizationId, ')
          ..write('educationLevel: $educationLevel, ')
          ..write('posts: $posts, ')
          ..write('academicDegree: $academicDegree, ')
          ..write('academicTitle: $academicTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    id,
    status,
    lastNameRu,
    lastNameEn,
    firstNameRu,
    firstNameEn,
    middleNameRu,
    middleNameEn,
    organizationId,
    educationLevel,
    posts,
    academicDegree,
    academicTitle,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthorData &&
          other.uid == this.uid &&
          other.id == this.id &&
          other.status == this.status &&
          other.lastNameRu == this.lastNameRu &&
          other.lastNameEn == this.lastNameEn &&
          other.firstNameRu == this.firstNameRu &&
          other.firstNameEn == this.firstNameEn &&
          other.middleNameRu == this.middleNameRu &&
          other.middleNameEn == this.middleNameEn &&
          other.organizationId == this.organizationId &&
          other.educationLevel == this.educationLevel &&
          other.posts == this.posts &&
          other.academicDegree == this.academicDegree &&
          other.academicTitle == this.academicTitle);
}

class AuthorCompanion extends UpdateCompanion<AuthorData> {
  final Value<String> uid;
  final Value<int> id;
  final Value<String> status;
  final Value<String> lastNameRu;
  final Value<String> lastNameEn;
  final Value<String> firstNameRu;
  final Value<String> firstNameEn;
  final Value<String?> middleNameRu;
  final Value<String?> middleNameEn;
  final Value<int> organizationId;
  final Value<String?> educationLevel;
  final Value<List<Post>?> posts;
  final Value<String?> academicDegree;
  final Value<String?> academicTitle;
  const AuthorCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.status = const Value.absent(),
    this.lastNameRu = const Value.absent(),
    this.lastNameEn = const Value.absent(),
    this.firstNameRu = const Value.absent(),
    this.firstNameEn = const Value.absent(),
    this.middleNameRu = const Value.absent(),
    this.middleNameEn = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.educationLevel = const Value.absent(),
    this.posts = const Value.absent(),
    this.academicDegree = const Value.absent(),
    this.academicTitle = const Value.absent(),
  });
  AuthorCompanion.insert({
    required String uid,
    this.id = const Value.absent(),
    required String status,
    required String lastNameRu,
    required String lastNameEn,
    required String firstNameRu,
    required String firstNameEn,
    this.middleNameRu = const Value.absent(),
    this.middleNameEn = const Value.absent(),
    required int organizationId,
    this.educationLevel = const Value.absent(),
    this.posts = const Value.absent(),
    this.academicDegree = const Value.absent(),
    this.academicTitle = const Value.absent(),
  }) : uid = Value(uid),
       status = Value(status),
       lastNameRu = Value(lastNameRu),
       lastNameEn = Value(lastNameEn),
       firstNameRu = Value(firstNameRu),
       firstNameEn = Value(firstNameEn),
       organizationId = Value(organizationId);
  static Insertable<AuthorData> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<String>? status,
    Expression<String>? lastNameRu,
    Expression<String>? lastNameEn,
    Expression<String>? firstNameRu,
    Expression<String>? firstNameEn,
    Expression<String>? middleNameRu,
    Expression<String>? middleNameEn,
    Expression<int>? organizationId,
    Expression<String>? educationLevel,
    Expression<String>? posts,
    Expression<String>? academicDegree,
    Expression<String>? academicTitle,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (status != null) 'status': status,
      if (lastNameRu != null) 'last_name_ru': lastNameRu,
      if (lastNameEn != null) 'last_name_en': lastNameEn,
      if (firstNameRu != null) 'first_name_ru': firstNameRu,
      if (firstNameEn != null) 'first_name_en': firstNameEn,
      if (middleNameRu != null) 'middle_name_ru': middleNameRu,
      if (middleNameEn != null) 'middle_name_en': middleNameEn,
      if (organizationId != null) 'organization_id': organizationId,
      if (educationLevel != null) 'education_level': educationLevel,
      if (posts != null) 'posts': posts,
      if (academicDegree != null) 'academic_degree': academicDegree,
      if (academicTitle != null) 'academic_title': academicTitle,
    });
  }

  AuthorCompanion copyWith({
    Value<String>? uid,
    Value<int>? id,
    Value<String>? status,
    Value<String>? lastNameRu,
    Value<String>? lastNameEn,
    Value<String>? firstNameRu,
    Value<String>? firstNameEn,
    Value<String?>? middleNameRu,
    Value<String?>? middleNameEn,
    Value<int>? organizationId,
    Value<String?>? educationLevel,
    Value<List<Post>?>? posts,
    Value<String?>? academicDegree,
    Value<String?>? academicTitle,
  }) {
    return AuthorCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      status: status ?? this.status,
      lastNameRu: lastNameRu ?? this.lastNameRu,
      lastNameEn: lastNameEn ?? this.lastNameEn,
      firstNameRu: firstNameRu ?? this.firstNameRu,
      firstNameEn: firstNameEn ?? this.firstNameEn,
      middleNameRu: middleNameRu ?? this.middleNameRu,
      middleNameEn: middleNameEn ?? this.middleNameEn,
      organizationId: organizationId ?? this.organizationId,
      educationLevel: educationLevel ?? this.educationLevel,
      posts: posts ?? this.posts,
      academicDegree: academicDegree ?? this.academicDegree,
      academicTitle: academicTitle ?? this.academicTitle,
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
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (lastNameRu.present) {
      map['last_name_ru'] = Variable<String>(lastNameRu.value);
    }
    if (lastNameEn.present) {
      map['last_name_en'] = Variable<String>(lastNameEn.value);
    }
    if (firstNameRu.present) {
      map['first_name_ru'] = Variable<String>(firstNameRu.value);
    }
    if (firstNameEn.present) {
      map['first_name_en'] = Variable<String>(firstNameEn.value);
    }
    if (middleNameRu.present) {
      map['middle_name_ru'] = Variable<String>(middleNameRu.value);
    }
    if (middleNameEn.present) {
      map['middle_name_en'] = Variable<String>(middleNameEn.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<int>(organizationId.value);
    }
    if (educationLevel.present) {
      map['education_level'] = Variable<String>(educationLevel.value);
    }
    if (posts.present) {
      map['posts'] = Variable<String>(
        $AuthorTable.$converterposts.toSql(posts.value),
      );
    }
    if (academicDegree.present) {
      map['academic_degree'] = Variable<String>(academicDegree.value);
    }
    if (academicTitle.present) {
      map['academic_title'] = Variable<String>(academicTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('lastNameRu: $lastNameRu, ')
          ..write('lastNameEn: $lastNameEn, ')
          ..write('firstNameRu: $firstNameRu, ')
          ..write('firstNameEn: $firstNameEn, ')
          ..write('middleNameRu: $middleNameRu, ')
          ..write('middleNameEn: $middleNameEn, ')
          ..write('organizationId: $organizationId, ')
          ..write('educationLevel: $educationLevel, ')
          ..write('posts: $posts, ')
          ..write('academicDegree: $academicDegree, ')
          ..write('academicTitle: $academicTitle')
          ..write(')'))
        .toString();
  }
}

class $EditorTable extends Editor with TableInfo<$EditorTable, EditorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EditorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (uid)',
    ),
  );
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
  @override
  List<GeneratedColumn> get $columns => [uid, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'editor';
  @override
  VerificationContext validateIntegrity(
    Insertable<EditorData> instance, {
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EditorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EditorData(
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
  $EditorTable createAlias(String alias) {
    return $EditorTable(attachedDatabase, alias);
  }
}

class EditorData extends DataClass implements Insertable<EditorData> {
  final String uid;
  final int id;
  const EditorData({required this.uid, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['id'] = Variable<int>(id);
    return map;
  }

  EditorCompanion toCompanion(bool nullToAbsent) {
    return EditorCompanion(uid: Value(uid), id: Value(id));
  }

  factory EditorData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EditorData(
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

  EditorData copyWith({String? uid, int? id}) =>
      EditorData(uid: uid ?? this.uid, id: id ?? this.id);
  EditorData copyWithCompanion(EditorCompanion data) {
    return EditorData(
      uid: data.uid.present ? data.uid.value : this.uid,
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EditorData(')
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
      (other is EditorData && other.uid == this.uid && other.id == this.id);
}

class EditorCompanion extends UpdateCompanion<EditorData> {
  final Value<String> uid;
  final Value<int> id;
  const EditorCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
  });
  EditorCompanion.insert({required String uid, this.id = const Value.absent()})
    : uid = Value(uid);
  static Insertable<EditorData> custom({
    Expression<String>? uid,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
    });
  }

  EditorCompanion copyWith({Value<String>? uid, Value<int>? id}) {
    return EditorCompanion(uid: uid ?? this.uid, id: id ?? this.id);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EditorCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ReviewerTable extends Reviewer
    with TableInfo<$ReviewerTable, ReviewerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (uid)',
    ),
  );
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
  @override
  List<GeneratedColumn> get $columns => [uid, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviewer';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReviewerData> instance, {
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReviewerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewerData(
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
  $ReviewerTable createAlias(String alias) {
    return $ReviewerTable(attachedDatabase, alias);
  }
}

class ReviewerData extends DataClass implements Insertable<ReviewerData> {
  final String uid;
  final int id;
  const ReviewerData({required this.uid, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['id'] = Variable<int>(id);
    return map;
  }

  ReviewerCompanion toCompanion(bool nullToAbsent) {
    return ReviewerCompanion(uid: Value(uid), id: Value(id));
  }

  factory ReviewerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewerData(
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

  ReviewerData copyWith({String? uid, int? id}) =>
      ReviewerData(uid: uid ?? this.uid, id: id ?? this.id);
  ReviewerData copyWithCompanion(ReviewerCompanion data) {
    return ReviewerData(
      uid: data.uid.present ? data.uid.value : this.uid,
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewerData(')
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
      (other is ReviewerData && other.uid == this.uid && other.id == this.id);
}

class ReviewerCompanion extends UpdateCompanion<ReviewerData> {
  final Value<String> uid;
  final Value<int> id;
  const ReviewerCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
  });
  ReviewerCompanion.insert({
    required String uid,
    this.id = const Value.absent(),
  }) : uid = Value(uid);
  static Insertable<ReviewerData> custom({
    Expression<String>? uid,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
    });
  }

  ReviewerCompanion copyWith({Value<String>? uid, Value<int>? id}) {
    return ReviewerCompanion(uid: uid ?? this.uid, id: id ?? this.id);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewerCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id')
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
      'REFERENCES user (uid)',
    ),
  );
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
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
  const AdminCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
  });
  AdminCompanion.insert({required String uid, this.id = const Value.absent()})
    : uid = Value(uid);
  static Insertable<AdminData> custom({
    Expression<String>? uid,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
    });
  }

  AdminCompanion copyWith({Value<String>? uid, Value<int>? id}) {
    return AdminCompanion(uid: uid ?? this.uid, id: id ?? this.id);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ConferenceTable extends Conference
    with TableInfo<$ConferenceTable, ConferenceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConferenceTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _shortDescriptionMeta = const VerificationMeta(
    'shortDescription',
  );
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
    'short_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startConferenceDateMeta =
      const VerificationMeta('startConferenceDate');
  @override
  late final GeneratedColumn<DateTime> startConferenceDate =
      GeneratedColumn<DateTime>(
        'start_conference_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _endConferenceDateMeta = const VerificationMeta(
    'endConferenceDate',
  );
  @override
  late final GeneratedColumn<DateTime> endConferenceDate =
      GeneratedColumn<DateTime>(
        'end_conference_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<ConferenceFormat>?, String>
  conferenceFormat =
      GeneratedColumn<String>(
        'conference_format',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<ConferenceFormat>?>(
        $ConferenceTable.$converterconferenceFormat,
      );
  static const VerificationMeta _submissionStartDateMeta =
      const VerificationMeta('submissionStartDate');
  @override
  late final GeneratedColumn<DateTime> submissionStartDate =
      GeneratedColumn<DateTime>(
        'submission_start_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _submissionEndDateMeta = const VerificationMeta(
    'submissionEndDate',
  );
  @override
  late final GeneratedColumn<DateTime> submissionEndDate =
      GeneratedColumn<DateTime>(
        'submission_end_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _quantityOfPagesMeta = const VerificationMeta(
    'quantityOfPages',
  );
  @override
  late final GeneratedColumn<int> quantityOfPages = GeneratedColumn<int>(
    'quantity_of_pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<FileFormat>?, String>
  fileFormat = GeneratedColumn<String>(
    'file_format',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<FileFormat>?>($ConferenceTable.$converterfileFormat);
  static const VerificationMeta _requirementsMeta = const VerificationMeta(
    'requirements',
  );
  @override
  late final GeneratedColumn<String> requirements = GeneratedColumn<String>(
    'requirements',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conference';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConferenceData> instance, {
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
    if (data.containsKey('short_description')) {
      context.handle(
        _shortDescriptionMeta,
        shortDescription.isAcceptableOrUnknown(
          data['short_description']!,
          _shortDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('start_conference_date')) {
      context.handle(
        _startConferenceDateMeta,
        startConferenceDate.isAcceptableOrUnknown(
          data['start_conference_date']!,
          _startConferenceDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startConferenceDateMeta);
    }
    if (data.containsKey('end_conference_date')) {
      context.handle(
        _endConferenceDateMeta,
        endConferenceDate.isAcceptableOrUnknown(
          data['end_conference_date']!,
          _endConferenceDateMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('submission_start_date')) {
      context.handle(
        _submissionStartDateMeta,
        submissionStartDate.isAcceptableOrUnknown(
          data['submission_start_date']!,
          _submissionStartDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_submissionStartDateMeta);
    }
    if (data.containsKey('submission_end_date')) {
      context.handle(
        _submissionEndDateMeta,
        submissionEndDate.isAcceptableOrUnknown(
          data['submission_end_date']!,
          _submissionEndDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_submissionEndDateMeta);
    }
    if (data.containsKey('quantity_of_pages')) {
      context.handle(
        _quantityOfPagesMeta,
        quantityOfPages.isAcceptableOrUnknown(
          data['quantity_of_pages']!,
          _quantityOfPagesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityOfPagesMeta);
    }
    if (data.containsKey('requirements')) {
      context.handle(
        _requirementsMeta,
        requirements.isAcceptableOrUnknown(
          data['requirements']!,
          _requirementsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requirementsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConferenceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConferenceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      shortDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_description'],
      )!,
      startConferenceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_conference_date'],
      )!,
      endConferenceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_conference_date'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      conferenceFormat: $ConferenceTable.$converterconferenceFormat.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}conference_format'],
        ),
      ),
      submissionStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}submission_start_date'],
      )!,
      submissionEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}submission_end_date'],
      )!,
      quantityOfPages: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_of_pages'],
      )!,
      fileFormat: $ConferenceTable.$converterfileFormat.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}file_format'],
        ),
      ),
      requirements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}requirements'],
      )!,
    );
  }

  @override
  $ConferenceTable createAlias(String alias) {
    return $ConferenceTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ConferenceFormat>?, String?>
  $converterconferenceFormat = ConferenceFormatConverter();
  static TypeConverter<List<FileFormat>?, String?> $converterfileFormat =
      FileFormatConverter();
}

class ConferenceData extends DataClass implements Insertable<ConferenceData> {
  final int id;
  final String title;
  final String shortDescription;
  final DateTime startConferenceDate;
  final DateTime? endConferenceDate;
  final String address;
  final List<ConferenceFormat>? conferenceFormat;
  final DateTime submissionStartDate;
  final DateTime submissionEndDate;
  final int quantityOfPages;
  final List<FileFormat>? fileFormat;
  final String requirements;
  const ConferenceData({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.startConferenceDate,
    this.endConferenceDate,
    required this.address,
    this.conferenceFormat,
    required this.submissionStartDate,
    required this.submissionEndDate,
    required this.quantityOfPages,
    this.fileFormat,
    required this.requirements,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['short_description'] = Variable<String>(shortDescription);
    map['start_conference_date'] = Variable<DateTime>(startConferenceDate);
    if (!nullToAbsent || endConferenceDate != null) {
      map['end_conference_date'] = Variable<DateTime>(endConferenceDate);
    }
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || conferenceFormat != null) {
      map['conference_format'] = Variable<String>(
        $ConferenceTable.$converterconferenceFormat.toSql(conferenceFormat),
      );
    }
    map['submission_start_date'] = Variable<DateTime>(submissionStartDate);
    map['submission_end_date'] = Variable<DateTime>(submissionEndDate);
    map['quantity_of_pages'] = Variable<int>(quantityOfPages);
    if (!nullToAbsent || fileFormat != null) {
      map['file_format'] = Variable<String>(
        $ConferenceTable.$converterfileFormat.toSql(fileFormat),
      );
    }
    map['requirements'] = Variable<String>(requirements);
    return map;
  }

  ConferenceCompanion toCompanion(bool nullToAbsent) {
    return ConferenceCompanion(
      id: Value(id),
      title: Value(title),
      shortDescription: Value(shortDescription),
      startConferenceDate: Value(startConferenceDate),
      endConferenceDate: endConferenceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endConferenceDate),
      address: Value(address),
      conferenceFormat: conferenceFormat == null && nullToAbsent
          ? const Value.absent()
          : Value(conferenceFormat),
      submissionStartDate: Value(submissionStartDate),
      submissionEndDate: Value(submissionEndDate),
      quantityOfPages: Value(quantityOfPages),
      fileFormat: fileFormat == null && nullToAbsent
          ? const Value.absent()
          : Value(fileFormat),
      requirements: Value(requirements),
    );
  }

  factory ConferenceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConferenceData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      startConferenceDate: serializer.fromJson<DateTime>(
        json['startConferenceDate'],
      ),
      endConferenceDate: serializer.fromJson<DateTime?>(
        json['endConferenceDate'],
      ),
      address: serializer.fromJson<String>(json['address']),
      conferenceFormat: serializer.fromJson<List<ConferenceFormat>?>(
        json['conferenceFormat'],
      ),
      submissionStartDate: serializer.fromJson<DateTime>(
        json['submissionStartDate'],
      ),
      submissionEndDate: serializer.fromJson<DateTime>(
        json['submissionEndDate'],
      ),
      quantityOfPages: serializer.fromJson<int>(json['quantityOfPages']),
      fileFormat: serializer.fromJson<List<FileFormat>?>(json['fileFormat']),
      requirements: serializer.fromJson<String>(json['requirements']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'startConferenceDate': serializer.toJson<DateTime>(startConferenceDate),
      'endConferenceDate': serializer.toJson<DateTime?>(endConferenceDate),
      'address': serializer.toJson<String>(address),
      'conferenceFormat': serializer.toJson<List<ConferenceFormat>?>(
        conferenceFormat,
      ),
      'submissionStartDate': serializer.toJson<DateTime>(submissionStartDate),
      'submissionEndDate': serializer.toJson<DateTime>(submissionEndDate),
      'quantityOfPages': serializer.toJson<int>(quantityOfPages),
      'fileFormat': serializer.toJson<List<FileFormat>?>(fileFormat),
      'requirements': serializer.toJson<String>(requirements),
    };
  }

  ConferenceData copyWith({
    int? id,
    String? title,
    String? shortDescription,
    DateTime? startConferenceDate,
    Value<DateTime?> endConferenceDate = const Value.absent(),
    String? address,
    Value<List<ConferenceFormat>?> conferenceFormat = const Value.absent(),
    DateTime? submissionStartDate,
    DateTime? submissionEndDate,
    int? quantityOfPages,
    Value<List<FileFormat>?> fileFormat = const Value.absent(),
    String? requirements,
  }) => ConferenceData(
    id: id ?? this.id,
    title: title ?? this.title,
    shortDescription: shortDescription ?? this.shortDescription,
    startConferenceDate: startConferenceDate ?? this.startConferenceDate,
    endConferenceDate: endConferenceDate.present
        ? endConferenceDate.value
        : this.endConferenceDate,
    address: address ?? this.address,
    conferenceFormat: conferenceFormat.present
        ? conferenceFormat.value
        : this.conferenceFormat,
    submissionStartDate: submissionStartDate ?? this.submissionStartDate,
    submissionEndDate: submissionEndDate ?? this.submissionEndDate,
    quantityOfPages: quantityOfPages ?? this.quantityOfPages,
    fileFormat: fileFormat.present ? fileFormat.value : this.fileFormat,
    requirements: requirements ?? this.requirements,
  );
  ConferenceData copyWithCompanion(ConferenceCompanion data) {
    return ConferenceData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      startConferenceDate: data.startConferenceDate.present
          ? data.startConferenceDate.value
          : this.startConferenceDate,
      endConferenceDate: data.endConferenceDate.present
          ? data.endConferenceDate.value
          : this.endConferenceDate,
      address: data.address.present ? data.address.value : this.address,
      conferenceFormat: data.conferenceFormat.present
          ? data.conferenceFormat.value
          : this.conferenceFormat,
      submissionStartDate: data.submissionStartDate.present
          ? data.submissionStartDate.value
          : this.submissionStartDate,
      submissionEndDate: data.submissionEndDate.present
          ? data.submissionEndDate.value
          : this.submissionEndDate,
      quantityOfPages: data.quantityOfPages.present
          ? data.quantityOfPages.value
          : this.quantityOfPages,
      fileFormat: data.fileFormat.present
          ? data.fileFormat.value
          : this.fileFormat,
      requirements: data.requirements.present
          ? data.requirements.value
          : this.requirements,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConferenceData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('startConferenceDate: $startConferenceDate, ')
          ..write('endConferenceDate: $endConferenceDate, ')
          ..write('address: $address, ')
          ..write('conferenceFormat: $conferenceFormat, ')
          ..write('submissionStartDate: $submissionStartDate, ')
          ..write('submissionEndDate: $submissionEndDate, ')
          ..write('quantityOfPages: $quantityOfPages, ')
          ..write('fileFormat: $fileFormat, ')
          ..write('requirements: $requirements')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConferenceData &&
          other.id == this.id &&
          other.title == this.title &&
          other.shortDescription == this.shortDescription &&
          other.startConferenceDate == this.startConferenceDate &&
          other.endConferenceDate == this.endConferenceDate &&
          other.address == this.address &&
          other.conferenceFormat == this.conferenceFormat &&
          other.submissionStartDate == this.submissionStartDate &&
          other.submissionEndDate == this.submissionEndDate &&
          other.quantityOfPages == this.quantityOfPages &&
          other.fileFormat == this.fileFormat &&
          other.requirements == this.requirements);
}

class ConferenceCompanion extends UpdateCompanion<ConferenceData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> shortDescription;
  final Value<DateTime> startConferenceDate;
  final Value<DateTime?> endConferenceDate;
  final Value<String> address;
  final Value<List<ConferenceFormat>?> conferenceFormat;
  final Value<DateTime> submissionStartDate;
  final Value<DateTime> submissionEndDate;
  final Value<int> quantityOfPages;
  final Value<List<FileFormat>?> fileFormat;
  final Value<String> requirements;
  const ConferenceCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.startConferenceDate = const Value.absent(),
    this.endConferenceDate = const Value.absent(),
    this.address = const Value.absent(),
    this.conferenceFormat = const Value.absent(),
    this.submissionStartDate = const Value.absent(),
    this.submissionEndDate = const Value.absent(),
    this.quantityOfPages = const Value.absent(),
    this.fileFormat = const Value.absent(),
    this.requirements = const Value.absent(),
  });
  ConferenceCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String shortDescription,
    required DateTime startConferenceDate,
    this.endConferenceDate = const Value.absent(),
    required String address,
    this.conferenceFormat = const Value.absent(),
    required DateTime submissionStartDate,
    required DateTime submissionEndDate,
    required int quantityOfPages,
    this.fileFormat = const Value.absent(),
    required String requirements,
  }) : title = Value(title),
       shortDescription = Value(shortDescription),
       startConferenceDate = Value(startConferenceDate),
       address = Value(address),
       submissionStartDate = Value(submissionStartDate),
       submissionEndDate = Value(submissionEndDate),
       quantityOfPages = Value(quantityOfPages),
       requirements = Value(requirements);
  static Insertable<ConferenceData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? shortDescription,
    Expression<DateTime>? startConferenceDate,
    Expression<DateTime>? endConferenceDate,
    Expression<String>? address,
    Expression<String>? conferenceFormat,
    Expression<DateTime>? submissionStartDate,
    Expression<DateTime>? submissionEndDate,
    Expression<int>? quantityOfPages,
    Expression<String>? fileFormat,
    Expression<String>? requirements,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (shortDescription != null) 'short_description': shortDescription,
      if (startConferenceDate != null)
        'start_conference_date': startConferenceDate,
      if (endConferenceDate != null) 'end_conference_date': endConferenceDate,
      if (address != null) 'address': address,
      if (conferenceFormat != null) 'conference_format': conferenceFormat,
      if (submissionStartDate != null)
        'submission_start_date': submissionStartDate,
      if (submissionEndDate != null) 'submission_end_date': submissionEndDate,
      if (quantityOfPages != null) 'quantity_of_pages': quantityOfPages,
      if (fileFormat != null) 'file_format': fileFormat,
      if (requirements != null) 'requirements': requirements,
    });
  }

  ConferenceCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? shortDescription,
    Value<DateTime>? startConferenceDate,
    Value<DateTime?>? endConferenceDate,
    Value<String>? address,
    Value<List<ConferenceFormat>?>? conferenceFormat,
    Value<DateTime>? submissionStartDate,
    Value<DateTime>? submissionEndDate,
    Value<int>? quantityOfPages,
    Value<List<FileFormat>?>? fileFormat,
    Value<String>? requirements,
  }) {
    return ConferenceCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      shortDescription: shortDescription ?? this.shortDescription,
      startConferenceDate: startConferenceDate ?? this.startConferenceDate,
      endConferenceDate: endConferenceDate ?? this.endConferenceDate,
      address: address ?? this.address,
      conferenceFormat: conferenceFormat ?? this.conferenceFormat,
      submissionStartDate: submissionStartDate ?? this.submissionStartDate,
      submissionEndDate: submissionEndDate ?? this.submissionEndDate,
      quantityOfPages: quantityOfPages ?? this.quantityOfPages,
      fileFormat: fileFormat ?? this.fileFormat,
      requirements: requirements ?? this.requirements,
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
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (startConferenceDate.present) {
      map['start_conference_date'] = Variable<DateTime>(
        startConferenceDate.value,
      );
    }
    if (endConferenceDate.present) {
      map['end_conference_date'] = Variable<DateTime>(endConferenceDate.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (conferenceFormat.present) {
      map['conference_format'] = Variable<String>(
        $ConferenceTable.$converterconferenceFormat.toSql(
          conferenceFormat.value,
        ),
      );
    }
    if (submissionStartDate.present) {
      map['submission_start_date'] = Variable<DateTime>(
        submissionStartDate.value,
      );
    }
    if (submissionEndDate.present) {
      map['submission_end_date'] = Variable<DateTime>(submissionEndDate.value);
    }
    if (quantityOfPages.present) {
      map['quantity_of_pages'] = Variable<int>(quantityOfPages.value);
    }
    if (fileFormat.present) {
      map['file_format'] = Variable<String>(
        $ConferenceTable.$converterfileFormat.toSql(fileFormat.value),
      );
    }
    if (requirements.present) {
      map['requirements'] = Variable<String>(requirements.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConferenceCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('startConferenceDate: $startConferenceDate, ')
          ..write('endConferenceDate: $endConferenceDate, ')
          ..write('address: $address, ')
          ..write('conferenceFormat: $conferenceFormat, ')
          ..write('submissionStartDate: $submissionStartDate, ')
          ..write('submissionEndDate: $submissionEndDate, ')
          ..write('quantityOfPages: $quantityOfPages, ')
          ..write('fileFormat: $fileFormat, ')
          ..write('requirements: $requirements')
          ..write(')'))
        .toString();
  }
}

class $SectionTable extends Section with TableInfo<$SectionTable, SectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'section';
  @override
  VerificationContext validateIntegrity(
    Insertable<SectionData> instance, {
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
  SectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SectionData(
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
  $SectionTable createAlias(String alias) {
    return $SectionTable(attachedDatabase, alias);
  }
}

class SectionData extends DataClass implements Insertable<SectionData> {
  final int id;
  final String title;
  const SectionData({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  SectionCompanion toCompanion(bool nullToAbsent) {
    return SectionCompanion(id: Value(id), title: Value(title));
  }

  factory SectionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SectionData(
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

  SectionData copyWith({int? id, String? title}) =>
      SectionData(id: id ?? this.id, title: title ?? this.title);
  SectionData copyWithCompanion(SectionCompanion data) {
    return SectionData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SectionData(')
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
      (other is SectionData &&
          other.id == this.id &&
          other.title == this.title);
}

class SectionCompanion extends UpdateCompanion<SectionData> {
  final Value<int> id;
  final Value<String> title;
  const SectionCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  SectionCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<SectionData> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  SectionCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return SectionCompanion(id: id ?? this.id, title: title ?? this.title);
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
    return (StringBuffer('SectionCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $ChatTable extends Chat with TableInfo<$ChatTable, ChatData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES author (id)',
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
      'REFERENCES editor (id)',
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
      'REFERENCES reviewer (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, authorId, editorId, reviewerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatData> instance, {
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
  ChatData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatData(
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
  $ChatTable createAlias(String alias) {
    return $ChatTable(attachedDatabase, alias);
  }
}

class ChatData extends DataClass implements Insertable<ChatData> {
  final int id;
  final int authorId;
  final int editorId;
  final int reviewerId;
  const ChatData({
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

  ChatCompanion toCompanion(bool nullToAbsent) {
    return ChatCompanion(
      id: Value(id),
      authorId: Value(authorId),
      editorId: Value(editorId),
      reviewerId: Value(reviewerId),
    );
  }

  factory ChatData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatData(
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

  ChatData copyWith({int? id, int? authorId, int? editorId, int? reviewerId}) =>
      ChatData(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        editorId: editorId ?? this.editorId,
        reviewerId: reviewerId ?? this.reviewerId,
      );
  ChatData copyWithCompanion(ChatCompanion data) {
    return ChatData(
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
    return (StringBuffer('ChatData(')
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
      (other is ChatData &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.editorId == this.editorId &&
          other.reviewerId == this.reviewerId);
}

class ChatCompanion extends UpdateCompanion<ChatData> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<int> editorId;
  final Value<int> reviewerId;
  const ChatCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.editorId = const Value.absent(),
    this.reviewerId = const Value.absent(),
  });
  ChatCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required int editorId,
    required int reviewerId,
  }) : authorId = Value(authorId),
       editorId = Value(editorId),
       reviewerId = Value(reviewerId);
  static Insertable<ChatData> custom({
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

  ChatCompanion copyWith({
    Value<int>? id,
    Value<int>? authorId,
    Value<int>? editorId,
    Value<int>? reviewerId,
  }) {
    return ChatCompanion(
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
    return (StringBuffer('ChatCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('editorId: $editorId, ')
          ..write('reviewerId: $reviewerId')
          ..write(')'))
        .toString();
  }
}

class $RequestTable extends Request with TableInfo<$RequestTable, RequestData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES author (id)',
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
      'REFERENCES conference (id)',
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
      'REFERENCES section (id)',
    ),
  );
  static const VerificationMeta _coAuthorsMeta = const VerificationMeta(
    'coAuthors',
  );
  @override
  late final GeneratedColumn<String> coAuthors = GeneratedColumn<String>(
    'co_athors',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<int> chatId = GeneratedColumn<int>(
    'chat_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chat (id)',
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
    title,
    status,
    comment,
    chatId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'request';
  @override
  VerificationContext validateIntegrity(
    Insertable<RequestData> instance, {
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
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('chat_id')) {
      context.handle(
        _chatIdMeta,
        chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta),
      );
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
  RequestData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RequestData(
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
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      chatId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chat_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RequestTable createAlias(String alias) {
    return $RequestTable(attachedDatabase, alias);
  }
}

class RequestData extends DataClass implements Insertable<RequestData> {
  final int id;
  final int authorId;
  final int conferenceId;
  final int sectionId;
  final String? coAuthors;
  final String title;
  final String status;
  final String? comment;
  final int? chatId;
  final DateTime createdAt;
  const RequestData({
    required this.id,
    required this.authorId,
    required this.conferenceId,
    required this.sectionId,
    this.coAuthors,
    required this.title,
    required this.status,
    this.comment,
    this.chatId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author_id'] = Variable<int>(authorId);
    map['conference_id'] = Variable<int>(conferenceId);
    map['section_id'] = Variable<int>(sectionId);
    if (!nullToAbsent || coAuthors != null) {
      map['co_athors'] = Variable<String>(coAuthors);
    }
    map['title'] = Variable<String>(title);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || chatId != null) {
      map['chat_id'] = Variable<int>(chatId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RequestCompanion toCompanion(bool nullToAbsent) {
    return RequestCompanion(
      id: Value(id),
      authorId: Value(authorId),
      conferenceId: Value(conferenceId),
      sectionId: Value(sectionId),
      coAuthors: coAuthors == null && nullToAbsent
          ? const Value.absent()
          : Value(coAuthors),
      title: Value(title),
      status: Value(status),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      chatId: chatId == null && nullToAbsent
          ? const Value.absent()
          : Value(chatId),
      createdAt: Value(createdAt),
    );
  }

  factory RequestData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RequestData(
      id: serializer.fromJson<int>(json['id']),
      authorId: serializer.fromJson<int>(json['authorId']),
      conferenceId: serializer.fromJson<int>(json['conferenceId']),
      sectionId: serializer.fromJson<int>(json['sectionId']),
      coAuthors: serializer.fromJson<String?>(json['coAuthors']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      comment: serializer.fromJson<String?>(json['comment']),
      chatId: serializer.fromJson<int?>(json['chatId']),
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
      'coAuthors': serializer.toJson<String?>(coAuthors),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'comment': serializer.toJson<String?>(comment),
      'chatId': serializer.toJson<int?>(chatId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RequestData copyWith({
    int? id,
    int? authorId,
    int? conferenceId,
    int? sectionId,
    Value<String?> coAuthors = const Value.absent(),
    String? title,
    String? status,
    Value<String?> comment = const Value.absent(),
    Value<int?> chatId = const Value.absent(),
    DateTime? createdAt,
  }) => RequestData(
    id: id ?? this.id,
    authorId: authorId ?? this.authorId,
    conferenceId: conferenceId ?? this.conferenceId,
    sectionId: sectionId ?? this.sectionId,
    coAuthors: coAuthors.present ? coAuthors.value : this.coAuthors,
    title: title ?? this.title,
    status: status ?? this.status,
    comment: comment.present ? comment.value : this.comment,
    chatId: chatId.present ? chatId.value : this.chatId,
    createdAt: createdAt ?? this.createdAt,
  );
  RequestData copyWithCompanion(RequestCompanion data) {
    return RequestData(
      id: data.id.present ? data.id.value : this.id,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      conferenceId: data.conferenceId.present
          ? data.conferenceId.value
          : this.conferenceId,
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      coAuthors: data.coAuthors.present ? data.coAuthors.value : this.coAuthors,
      title: data.title.present ? data.title.value : this.title,
      status: data.status.present ? data.status.value : this.status,
      comment: data.comment.present ? data.comment.value : this.comment,
      chatId: data.chatId.present ? data.chatId.value : this.chatId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RequestData(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('conferenceId: $conferenceId, ')
          ..write('sectionId: $sectionId, ')
          ..write('coAuthors: $coAuthors, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('comment: $comment, ')
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
    title,
    status,
    comment,
    chatId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RequestData &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.conferenceId == this.conferenceId &&
          other.sectionId == this.sectionId &&
          other.coAuthors == this.coAuthors &&
          other.title == this.title &&
          other.status == this.status &&
          other.comment == this.comment &&
          other.chatId == this.chatId &&
          other.createdAt == this.createdAt);
}

class RequestCompanion extends UpdateCompanion<RequestData> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<int> conferenceId;
  final Value<int> sectionId;
  final Value<String?> coAuthors;
  final Value<String> title;
  final Value<String> status;
  final Value<String?> comment;
  final Value<int?> chatId;
  final Value<DateTime> createdAt;
  const RequestCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.conferenceId = const Value.absent(),
    this.sectionId = const Value.absent(),
    this.coAuthors = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.comment = const Value.absent(),
    this.chatId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RequestCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required int conferenceId,
    required int sectionId,
    this.coAuthors = const Value.absent(),
    required String title,
    required String status,
    this.comment = const Value.absent(),
    this.chatId = const Value.absent(),
    required DateTime createdAt,
  }) : authorId = Value(authorId),
       conferenceId = Value(conferenceId),
       sectionId = Value(sectionId),
       title = Value(title),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<RequestData> custom({
    Expression<int>? id,
    Expression<int>? authorId,
    Expression<int>? conferenceId,
    Expression<int>? sectionId,
    Expression<String>? coAuthors,
    Expression<String>? title,
    Expression<String>? status,
    Expression<String>? comment,
    Expression<int>? chatId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authorId != null) 'author_id': authorId,
      if (conferenceId != null) 'conference_id': conferenceId,
      if (sectionId != null) 'section_id': sectionId,
      if (coAuthors != null) 'co_athors': coAuthors,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (comment != null) 'comment': comment,
      if (chatId != null) 'chat_id': chatId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RequestCompanion copyWith({
    Value<int>? id,
    Value<int>? authorId,
    Value<int>? conferenceId,
    Value<int>? sectionId,
    Value<String?>? coAuthors,
    Value<String>? title,
    Value<String>? status,
    Value<String?>? comment,
    Value<int?>? chatId,
    Value<DateTime>? createdAt,
  }) {
    return RequestCompanion(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      conferenceId: conferenceId ?? this.conferenceId,
      sectionId: sectionId ?? this.sectionId,
      coAuthors: coAuthors ?? this.coAuthors,
      title: title ?? this.title,
      status: status ?? this.status,
      comment: comment ?? this.comment,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
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
    return (StringBuffer('RequestCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('conferenceId: $conferenceId, ')
          ..write('sectionId: $sectionId, ')
          ..write('coAuthors: $coAuthors, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('comment: $comment, ')
          ..write('chatId: $chatId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MessageTable extends Message with TableInfo<$MessageTable, MessageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES chat (id)',
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
      'REFERENCES user (uid)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, chatId, messageText, uid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessageData> instance, {
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
  MessageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageData(
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
  $MessageTable createAlias(String alias) {
    return $MessageTable(attachedDatabase, alias);
  }
}

class MessageData extends DataClass implements Insertable<MessageData> {
  final int id;
  final int chatId;
  final String messageText;
  final String uid;
  const MessageData({
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

  MessageCompanion toCompanion(bool nullToAbsent) {
    return MessageCompanion(
      id: Value(id),
      chatId: Value(chatId),
      messageText: Value(messageText),
      uid: Value(uid),
    );
  }

  factory MessageData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageData(
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

  MessageData copyWith({
    int? id,
    int? chatId,
    String? messageText,
    String? uid,
  }) => MessageData(
    id: id ?? this.id,
    chatId: chatId ?? this.chatId,
    messageText: messageText ?? this.messageText,
    uid: uid ?? this.uid,
  );
  MessageData copyWithCompanion(MessageCompanion data) {
    return MessageData(
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
    return (StringBuffer('MessageData(')
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
      (other is MessageData &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.messageText == this.messageText &&
          other.uid == this.uid);
}

class MessageCompanion extends UpdateCompanion<MessageData> {
  final Value<int> id;
  final Value<int> chatId;
  final Value<String> messageText;
  final Value<String> uid;
  const MessageCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.messageText = const Value.absent(),
    this.uid = const Value.absent(),
  });
  MessageCompanion.insert({
    this.id = const Value.absent(),
    required int chatId,
    required String messageText,
    required String uid,
  }) : chatId = Value(chatId),
       messageText = Value(messageText),
       uid = Value(uid);
  static Insertable<MessageData> custom({
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

  MessageCompanion copyWith({
    Value<int>? id,
    Value<int>? chatId,
    Value<String>? messageText,
    Value<String>? uid,
  }) {
    return MessageCompanion(
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
    return (StringBuffer('MessageCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('messageText: $messageText, ')
          ..write('uid: $uid')
          ..write(')'))
        .toString();
  }
}

class $RequestReviewersEditorsAssigmentTable
    extends RequestReviewersEditorsAssigment
    with
        TableInfo<
          $RequestReviewersEditorsAssigmentTable,
          RequestReviewersEditorsAssigmentData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestReviewersEditorsAssigmentTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES request (id)',
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
      'REFERENCES editor (id)',
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
      'REFERENCES reviewer (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, requestId, editorId, reviewerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'request_reviewers_editors_assigment';
  @override
  VerificationContext validateIntegrity(
    Insertable<RequestReviewersEditorsAssigmentData> instance, {
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
  RequestReviewersEditorsAssigmentData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RequestReviewersEditorsAssigmentData(
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
  $RequestReviewersEditorsAssigmentTable createAlias(String alias) {
    return $RequestReviewersEditorsAssigmentTable(attachedDatabase, alias);
  }
}

class RequestReviewersEditorsAssigmentData extends DataClass
    implements Insertable<RequestReviewersEditorsAssigmentData> {
  final int id;
  final int requestId;
  final int editorId;
  final int reviewerId;
  const RequestReviewersEditorsAssigmentData({
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

  RequestReviewersEditorsAssigmentCompanion toCompanion(bool nullToAbsent) {
    return RequestReviewersEditorsAssigmentCompanion(
      id: Value(id),
      requestId: Value(requestId),
      editorId: Value(editorId),
      reviewerId: Value(reviewerId),
    );
  }

  factory RequestReviewersEditorsAssigmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RequestReviewersEditorsAssigmentData(
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

  RequestReviewersEditorsAssigmentData copyWith({
    int? id,
    int? requestId,
    int? editorId,
    int? reviewerId,
  }) => RequestReviewersEditorsAssigmentData(
    id: id ?? this.id,
    requestId: requestId ?? this.requestId,
    editorId: editorId ?? this.editorId,
    reviewerId: reviewerId ?? this.reviewerId,
  );
  RequestReviewersEditorsAssigmentData copyWithCompanion(
    RequestReviewersEditorsAssigmentCompanion data,
  ) {
    return RequestReviewersEditorsAssigmentData(
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
    return (StringBuffer('RequestReviewersEditorsAssigmentData(')
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
      (other is RequestReviewersEditorsAssigmentData &&
          other.id == this.id &&
          other.requestId == this.requestId &&
          other.editorId == this.editorId &&
          other.reviewerId == this.reviewerId);
}

class RequestReviewersEditorsAssigmentCompanion
    extends UpdateCompanion<RequestReviewersEditorsAssigmentData> {
  final Value<int> id;
  final Value<int> requestId;
  final Value<int> editorId;
  final Value<int> reviewerId;
  const RequestReviewersEditorsAssigmentCompanion({
    this.id = const Value.absent(),
    this.requestId = const Value.absent(),
    this.editorId = const Value.absent(),
    this.reviewerId = const Value.absent(),
  });
  RequestReviewersEditorsAssigmentCompanion.insert({
    this.id = const Value.absent(),
    required int requestId,
    required int editorId,
    required int reviewerId,
  }) : requestId = Value(requestId),
       editorId = Value(editorId),
       reviewerId = Value(reviewerId);
  static Insertable<RequestReviewersEditorsAssigmentData> custom({
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

  RequestReviewersEditorsAssigmentCompanion copyWith({
    Value<int>? id,
    Value<int>? requestId,
    Value<int>? editorId,
    Value<int>? reviewerId,
  }) {
    return RequestReviewersEditorsAssigmentCompanion(
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
    return (StringBuffer('RequestReviewersEditorsAssigmentCompanion(')
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
  late final $UserTable user = $UserTable(this);
  late final $OrganizationTable organization = $OrganizationTable(this);
  late final $AuthorTable author = $AuthorTable(this);
  late final $EditorTable editor = $EditorTable(this);
  late final $ReviewerTable reviewer = $ReviewerTable(this);
  late final $AdminTable admin = $AdminTable(this);
  late final $ConferenceTable conference = $ConferenceTable(this);
  late final $SectionTable section = $SectionTable(this);
  late final $ChatTable chat = $ChatTable(this);
  late final $RequestTable request = $RequestTable(this);
  late final $MessageTable message = $MessageTable(this);
  late final $RequestReviewersEditorsAssigmentTable
  requestReviewersEditorsAssigment = $RequestReviewersEditorsAssigmentTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    user,
    organization,
    author,
    editor,
    reviewer,
    admin,
    conference,
    section,
    chat,
    request,
    message,
    requestReviewersEditorsAssigment,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$UserTableCreateCompanionBuilder =
    UserCompanion Function({
      required String uid,
      required String emailAddress,
      required String role,
      required String displayName,
      Value<String?> photoUrl,
      Value<int> rowid,
    });
typedef $$UserTableUpdateCompanionBuilder =
    UserCompanion Function({
      Value<String> uid,
      Value<String> emailAddress,
      Value<String> role,
      Value<String> displayName,
      Value<String?> photoUrl,
      Value<int> rowid,
    });

final class $$UserTableReferences
    extends BaseReferences<_$AppDatabase, $UserTable, UserData> {
  $$UserTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AuthorTable, List<AuthorData>> _authorRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.author,
    aliasName: $_aliasNameGenerator(db.user.uid, db.author.uid),
  );

  $$AuthorTableProcessedTableManager get authorRefs {
    final manager = $$AuthorTableTableManager(
      $_db,
      $_db.author,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_authorRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EditorTable, List<EditorData>> _editorRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.editor,
    aliasName: $_aliasNameGenerator(db.user.uid, db.editor.uid),
  );

  $$EditorTableProcessedTableManager get editorRefs {
    final manager = $$EditorTableTableManager(
      $_db,
      $_db.editor,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_editorRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReviewerTable, List<ReviewerData>>
  _reviewerRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reviewer,
    aliasName: $_aliasNameGenerator(db.user.uid, db.reviewer.uid),
  );

  $$ReviewerTableProcessedTableManager get reviewerRefs {
    final manager = $$ReviewerTableTableManager(
      $_db,
      $_db.reviewer,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_reviewerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AdminTable, List<AdminData>> _adminRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.admin,
    aliasName: $_aliasNameGenerator(db.user.uid, db.admin.uid),
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

  static MultiTypedResultKey<$MessageTable, List<MessageData>>
  _messageRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.message,
    aliasName: $_aliasNameGenerator(db.user.uid, db.message.uid),
  );

  $$MessageTableProcessedTableManager get messageRefs {
    final manager = $$MessageTableTableManager(
      $_db,
      $_db.message,
    ).filter((f) => f.uid.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_messageRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableFilterComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableFilterComposer({
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

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
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

  Expression<bool> authorRefs(
    Expression<bool> Function($$AuthorTableFilterComposer f) f,
  ) {
    final $$AuthorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableFilterComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> editorRefs(
    Expression<bool> Function($$EditorTableFilterComposer f) f,
  ) {
    final $$EditorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableFilterComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reviewerRefs(
    Expression<bool> Function($$ReviewerTableFilterComposer f) f,
  ) {
    final $$ReviewerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableFilterComposer(
            $db: $db,
            $table: $db.reviewer,
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

  Expression<bool> messageRefs(
    Expression<bool> Function($$MessageTableFilterComposer f) f,
  ) {
    final $$MessageTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.message,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageTableFilterComposer(
            $db: $db,
            $table: $db.message,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableOrderingComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableOrderingComposer({
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

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
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

class $$UserTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
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

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  Expression<T> authorRefs<T extends Object>(
    Expression<T> Function($$AuthorTableAnnotationComposer a) f,
  ) {
    final $$AuthorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableAnnotationComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> editorRefs<T extends Object>(
    Expression<T> Function($$EditorTableAnnotationComposer a) f,
  ) {
    final $$EditorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableAnnotationComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reviewerRefs<T extends Object>(
    Expression<T> Function($$ReviewerTableAnnotationComposer a) f,
  ) {
    final $$ReviewerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewer,
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

  Expression<T> messageRefs<T extends Object>(
    Expression<T> Function($$MessageTableAnnotationComposer a) f,
  ) {
    final $$MessageTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.message,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageTableAnnotationComposer(
            $db: $db,
            $table: $db.message,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTable,
          UserData,
          $$UserTableFilterComposer,
          $$UserTableOrderingComposer,
          $$UserTableAnnotationComposer,
          $$UserTableCreateCompanionBuilder,
          $$UserTableUpdateCompanionBuilder,
          (UserData, $$UserTableReferences),
          UserData,
          PrefetchHooks Function({
            bool authorRefs,
            bool editorRefs,
            bool reviewerRefs,
            bool adminRefs,
            bool messageRefs,
          })
        > {
  $$UserTableTableManager(_$AppDatabase db, $UserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion(
                uid: uid,
                emailAddress: emailAddress,
                role: role,
                displayName: displayName,
                photoUrl: photoUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String emailAddress,
                required String role,
                required String displayName,
                Value<String?> photoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion.insert(
                uid: uid,
                emailAddress: emailAddress,
                role: role,
                displayName: displayName,
                photoUrl: photoUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UserTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                authorRefs = false,
                editorRefs = false,
                reviewerRefs = false,
                adminRefs = false,
                messageRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (authorRefs) db.author,
                    if (editorRefs) db.editor,
                    if (reviewerRefs) db.reviewer,
                    if (adminRefs) db.admin,
                    if (messageRefs) db.message,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (authorRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          AuthorData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._authorRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableReferences(db, table, p0).authorRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (editorRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          EditorData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._editorRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableReferences(db, table, p0).editorRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (reviewerRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          ReviewerData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._reviewerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableReferences(db, table, p0).reviewerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (adminRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          AdminData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._adminRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableReferences(db, table, p0).adminRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uid == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (messageRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          MessageData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._messageRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableReferences(db, table, p0).messageRefs,
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

typedef $$UserTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTable,
      UserData,
      $$UserTableFilterComposer,
      $$UserTableOrderingComposer,
      $$UserTableAnnotationComposer,
      $$UserTableCreateCompanionBuilder,
      $$UserTableUpdateCompanionBuilder,
      (UserData, $$UserTableReferences),
      UserData,
      PrefetchHooks Function({
        bool authorRefs,
        bool editorRefs,
        bool reviewerRefs,
        bool adminRefs,
        bool messageRefs,
      })
    >;
typedef $$OrganizationTableCreateCompanionBuilder =
    OrganizationCompanion Function({
      Value<int> id,
      required String titleRu,
      required String titleEn,
    });
typedef $$OrganizationTableUpdateCompanionBuilder =
    OrganizationCompanion Function({
      Value<int> id,
      Value<String> titleRu,
      Value<String> titleEn,
    });

final class $$OrganizationTableReferences
    extends
        BaseReferences<_$AppDatabase, $OrganizationTable, OrganizationData> {
  $$OrganizationTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AuthorTable, List<AuthorData>> _authorRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.author,
    aliasName: $_aliasNameGenerator(
      db.organization.id,
      db.author.organizationId,
    ),
  );

  $$AuthorTableProcessedTableManager get authorRefs {
    final manager = $$AuthorTableTableManager(
      $_db,
      $_db.author,
    ).filter((f) => f.organizationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_authorRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrganizationTableFilterComposer
    extends Composer<_$AppDatabase, $OrganizationTable> {
  $$OrganizationTableFilterComposer({
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

  ColumnFilters<String> get titleRu => $composableBuilder(
    column: $table.titleRu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> authorRefs(
    Expression<bool> Function($$AuthorTableFilterComposer f) f,
  ) {
    final $$AuthorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.organizationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableFilterComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrganizationTableOrderingComposer
    extends Composer<_$AppDatabase, $OrganizationTable> {
  $$OrganizationTableOrderingComposer({
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

  ColumnOrderings<String> get titleRu => $composableBuilder(
    column: $table.titleRu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrganizationTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrganizationTable> {
  $$OrganizationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titleRu =>
      $composableBuilder(column: $table.titleRu, builder: (column) => column);

  GeneratedColumn<String> get titleEn =>
      $composableBuilder(column: $table.titleEn, builder: (column) => column);

  Expression<T> authorRefs<T extends Object>(
    Expression<T> Function($$AuthorTableAnnotationComposer a) f,
  ) {
    final $$AuthorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.organizationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableAnnotationComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrganizationTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrganizationTable,
          OrganizationData,
          $$OrganizationTableFilterComposer,
          $$OrganizationTableOrderingComposer,
          $$OrganizationTableAnnotationComposer,
          $$OrganizationTableCreateCompanionBuilder,
          $$OrganizationTableUpdateCompanionBuilder,
          (OrganizationData, $$OrganizationTableReferences),
          OrganizationData,
          PrefetchHooks Function({bool authorRefs})
        > {
  $$OrganizationTableTableManager(_$AppDatabase db, $OrganizationTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganizationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrganizationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrganizationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> titleRu = const Value.absent(),
                Value<String> titleEn = const Value.absent(),
              }) => OrganizationCompanion(
                id: id,
                titleRu: titleRu,
                titleEn: titleEn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String titleRu,
                required String titleEn,
              }) => OrganizationCompanion.insert(
                id: id,
                titleRu: titleRu,
                titleEn: titleEn,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrganizationTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({authorRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (authorRefs) db.author],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (authorRefs)
                    await $_getPrefetchedData<
                      OrganizationData,
                      $OrganizationTable,
                      AuthorData
                    >(
                      currentTable: table,
                      referencedTable: $$OrganizationTableReferences
                          ._authorRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$OrganizationTableReferences(
                            db,
                            table,
                            p0,
                          ).authorRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.organizationId == item.id,
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

typedef $$OrganizationTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrganizationTable,
      OrganizationData,
      $$OrganizationTableFilterComposer,
      $$OrganizationTableOrderingComposer,
      $$OrganizationTableAnnotationComposer,
      $$OrganizationTableCreateCompanionBuilder,
      $$OrganizationTableUpdateCompanionBuilder,
      (OrganizationData, $$OrganizationTableReferences),
      OrganizationData,
      PrefetchHooks Function({bool authorRefs})
    >;
typedef $$AuthorTableCreateCompanionBuilder =
    AuthorCompanion Function({
      required String uid,
      Value<int> id,
      required String status,
      required String lastNameRu,
      required String lastNameEn,
      required String firstNameRu,
      required String firstNameEn,
      Value<String?> middleNameRu,
      Value<String?> middleNameEn,
      required int organizationId,
      Value<String?> educationLevel,
      Value<List<Post>?> posts,
      Value<String?> academicDegree,
      Value<String?> academicTitle,
    });
typedef $$AuthorTableUpdateCompanionBuilder =
    AuthorCompanion Function({
      Value<String> uid,
      Value<int> id,
      Value<String> status,
      Value<String> lastNameRu,
      Value<String> lastNameEn,
      Value<String> firstNameRu,
      Value<String> firstNameEn,
      Value<String?> middleNameRu,
      Value<String?> middleNameEn,
      Value<int> organizationId,
      Value<String?> educationLevel,
      Value<List<Post>?> posts,
      Value<String?> academicDegree,
      Value<String?> academicTitle,
    });

final class $$AuthorTableReferences
    extends BaseReferences<_$AppDatabase, $AuthorTable, AuthorData> {
  $$AuthorTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _uidTable(_$AppDatabase db) =>
      db.user.createAlias($_aliasNameGenerator(db.author.uid, db.user.uid));

  $$UserTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OrganizationTable _organizationIdTable(_$AppDatabase db) =>
      db.organization.createAlias(
        $_aliasNameGenerator(db.author.organizationId, db.organization.id),
      );

  $$OrganizationTableProcessedTableManager get organizationId {
    final $_column = $_itemColumn<int>('organization_id')!;

    final manager = $$OrganizationTableTableManager(
      $_db,
      $_db.organization,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_organizationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChatTable, List<ChatData>> _chatRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chat,
    aliasName: $_aliasNameGenerator(db.author.id, db.chat.authorId),
  );

  $$ChatTableProcessedTableManager get chatRefs {
    final manager = $$ChatTableTableManager(
      $_db,
      $_db.chat,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chatRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RequestTable, List<RequestData>>
  _requestRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.request,
    aliasName: $_aliasNameGenerator(db.author.id, db.request.authorId),
  );

  $$RequestTableProcessedTableManager get requestRefs {
    final manager = $$RequestTableTableManager(
      $_db,
      $_db.request,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuthorTableFilterComposer
    extends Composer<_$AppDatabase, $AuthorTable> {
  $$AuthorTableFilterComposer({
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastNameRu => $composableBuilder(
    column: $table.lastNameRu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastNameEn => $composableBuilder(
    column: $table.lastNameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstNameRu => $composableBuilder(
    column: $table.firstNameRu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstNameEn => $composableBuilder(
    column: $table.firstNameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get middleNameRu => $composableBuilder(
    column: $table.middleNameRu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get middleNameEn => $composableBuilder(
    column: $table.middleNameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get educationLevel => $composableBuilder(
    column: $table.educationLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<Post>?, List<Post>, String> get posts =>
      $composableBuilder(
        column: $table.posts,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get academicDegree => $composableBuilder(
    column: $table.academicDegree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academicTitle => $composableBuilder(
    column: $table.academicTitle,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableFilterComposer get uid {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganizationTableFilterComposer get organizationId {
    final $$OrganizationTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.organizationId,
      referencedTable: $db.organization,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationTableFilterComposer(
            $db: $db,
            $table: $db.organization,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> chatRefs(
    Expression<bool> Function($$ChatTableFilterComposer f) f,
  ) {
    final $$ChatTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableFilterComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> requestRefs(
    Expression<bool> Function($$RequestTableFilterComposer f) f,
  ) {
    final $$RequestTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableFilterComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthorTable> {
  $$AuthorTableOrderingComposer({
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastNameRu => $composableBuilder(
    column: $table.lastNameRu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastNameEn => $composableBuilder(
    column: $table.lastNameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstNameRu => $composableBuilder(
    column: $table.firstNameRu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstNameEn => $composableBuilder(
    column: $table.firstNameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get middleNameRu => $composableBuilder(
    column: $table.middleNameRu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get middleNameEn => $composableBuilder(
    column: $table.middleNameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get educationLevel => $composableBuilder(
    column: $table.educationLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posts => $composableBuilder(
    column: $table.posts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academicDegree => $composableBuilder(
    column: $table.academicDegree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academicTitle => $composableBuilder(
    column: $table.academicTitle,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableOrderingComposer get uid {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganizationTableOrderingComposer get organizationId {
    final $$OrganizationTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.organizationId,
      referencedTable: $db.organization,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationTableOrderingComposer(
            $db: $db,
            $table: $db.organization,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuthorTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthorTable> {
  $$AuthorTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get lastNameRu => $composableBuilder(
    column: $table.lastNameRu,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastNameEn => $composableBuilder(
    column: $table.lastNameEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstNameRu => $composableBuilder(
    column: $table.firstNameRu,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstNameEn => $composableBuilder(
    column: $table.firstNameEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get middleNameRu => $composableBuilder(
    column: $table.middleNameRu,
    builder: (column) => column,
  );

  GeneratedColumn<String> get middleNameEn => $composableBuilder(
    column: $table.middleNameEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get educationLevel => $composableBuilder(
    column: $table.educationLevel,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Post>?, String> get posts =>
      $composableBuilder(column: $table.posts, builder: (column) => column);

  GeneratedColumn<String> get academicDegree => $composableBuilder(
    column: $table.academicDegree,
    builder: (column) => column,
  );

  GeneratedColumn<String> get academicTitle => $composableBuilder(
    column: $table.academicTitle,
    builder: (column) => column,
  );

  $$UserTableAnnotationComposer get uid {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganizationTableAnnotationComposer get organizationId {
    final $$OrganizationTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.organizationId,
      referencedTable: $db.organization,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationTableAnnotationComposer(
            $db: $db,
            $table: $db.organization,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> chatRefs<T extends Object>(
    Expression<T> Function($$ChatTableAnnotationComposer a) f,
  ) {
    final $$ChatTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableAnnotationComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> requestRefs<T extends Object>(
    Expression<T> Function($$RequestTableAnnotationComposer a) f,
  ) {
    final $$RequestTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableAnnotationComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthorTable,
          AuthorData,
          $$AuthorTableFilterComposer,
          $$AuthorTableOrderingComposer,
          $$AuthorTableAnnotationComposer,
          $$AuthorTableCreateCompanionBuilder,
          $$AuthorTableUpdateCompanionBuilder,
          (AuthorData, $$AuthorTableReferences),
          AuthorData,
          PrefetchHooks Function({
            bool uid,
            bool organizationId,
            bool chatRefs,
            bool requestRefs,
          })
        > {
  $$AuthorTableTableManager(_$AppDatabase db, $AuthorTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> lastNameRu = const Value.absent(),
                Value<String> lastNameEn = const Value.absent(),
                Value<String> firstNameRu = const Value.absent(),
                Value<String> firstNameEn = const Value.absent(),
                Value<String?> middleNameRu = const Value.absent(),
                Value<String?> middleNameEn = const Value.absent(),
                Value<int> organizationId = const Value.absent(),
                Value<String?> educationLevel = const Value.absent(),
                Value<List<Post>?> posts = const Value.absent(),
                Value<String?> academicDegree = const Value.absent(),
                Value<String?> academicTitle = const Value.absent(),
              }) => AuthorCompanion(
                uid: uid,
                id: id,
                status: status,
                lastNameRu: lastNameRu,
                lastNameEn: lastNameEn,
                firstNameRu: firstNameRu,
                firstNameEn: firstNameEn,
                middleNameRu: middleNameRu,
                middleNameEn: middleNameEn,
                organizationId: organizationId,
                educationLevel: educationLevel,
                posts: posts,
                academicDegree: academicDegree,
                academicTitle: academicTitle,
              ),
          createCompanionCallback:
              ({
                required String uid,
                Value<int> id = const Value.absent(),
                required String status,
                required String lastNameRu,
                required String lastNameEn,
                required String firstNameRu,
                required String firstNameEn,
                Value<String?> middleNameRu = const Value.absent(),
                Value<String?> middleNameEn = const Value.absent(),
                required int organizationId,
                Value<String?> educationLevel = const Value.absent(),
                Value<List<Post>?> posts = const Value.absent(),
                Value<String?> academicDegree = const Value.absent(),
                Value<String?> academicTitle = const Value.absent(),
              }) => AuthorCompanion.insert(
                uid: uid,
                id: id,
                status: status,
                lastNameRu: lastNameRu,
                lastNameEn: lastNameEn,
                firstNameRu: firstNameRu,
                firstNameEn: firstNameEn,
                middleNameRu: middleNameRu,
                middleNameEn: middleNameEn,
                organizationId: organizationId,
                educationLevel: educationLevel,
                posts: posts,
                academicDegree: academicDegree,
                academicTitle: academicTitle,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AuthorTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                uid = false,
                organizationId = false,
                chatRefs = false,
                requestRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (chatRefs) db.chat,
                    if (requestRefs) db.request,
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
                                    referencedTable: $$AuthorTableReferences
                                        ._uidTable(db),
                                    referencedColumn: $$AuthorTableReferences
                                        ._uidTable(db)
                                        .uid,
                                  )
                                  as T;
                        }
                        if (organizationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.organizationId,
                                    referencedTable: $$AuthorTableReferences
                                        ._organizationIdTable(db),
                                    referencedColumn: $$AuthorTableReferences
                                        ._organizationIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (chatRefs)
                        await $_getPrefetchedData<
                          AuthorData,
                          $AuthorTable,
                          ChatData
                        >(
                          currentTable: table,
                          referencedTable: $$AuthorTableReferences
                              ._chatRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AuthorTableReferences(db, table, p0).chatRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.authorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (requestRefs)
                        await $_getPrefetchedData<
                          AuthorData,
                          $AuthorTable,
                          RequestData
                        >(
                          currentTable: table,
                          referencedTable: $$AuthorTableReferences
                              ._requestRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AuthorTableReferences(
                                db,
                                table,
                                p0,
                              ).requestRefs,
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

typedef $$AuthorTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthorTable,
      AuthorData,
      $$AuthorTableFilterComposer,
      $$AuthorTableOrderingComposer,
      $$AuthorTableAnnotationComposer,
      $$AuthorTableCreateCompanionBuilder,
      $$AuthorTableUpdateCompanionBuilder,
      (AuthorData, $$AuthorTableReferences),
      AuthorData,
      PrefetchHooks Function({
        bool uid,
        bool organizationId,
        bool chatRefs,
        bool requestRefs,
      })
    >;
typedef $$EditorTableCreateCompanionBuilder =
    EditorCompanion Function({required String uid, Value<int> id});
typedef $$EditorTableUpdateCompanionBuilder =
    EditorCompanion Function({Value<String> uid, Value<int> id});

final class $$EditorTableReferences
    extends BaseReferences<_$AppDatabase, $EditorTable, EditorData> {
  $$EditorTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _uidTable(_$AppDatabase db) =>
      db.user.createAlias($_aliasNameGenerator(db.editor.uid, db.user.uid));

  $$UserTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChatTable, List<ChatData>> _chatRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chat,
    aliasName: $_aliasNameGenerator(db.editor.id, db.chat.editorId),
  );

  $$ChatTableProcessedTableManager get chatRefs {
    final manager = $$ChatTableTableManager(
      $_db,
      $_db.chat,
    ).filter((f) => f.editorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chatRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RequestReviewersEditorsAssigmentTable,
    List<RequestReviewersEditorsAssigmentData>
  >
  _requestReviewersEditorsAssigmentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.requestReviewersEditorsAssigment,
        aliasName: $_aliasNameGenerator(
          db.editor.id,
          db.requestReviewersEditorsAssigment.editorId,
        ),
      );

  $$RequestReviewersEditorsAssigmentTableProcessedTableManager
  get requestReviewersEditorsAssigmentRefs {
    final manager = $$RequestReviewersEditorsAssigmentTableTableManager(
      $_db,
      $_db.requestReviewersEditorsAssigment,
    ).filter((f) => f.editorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _requestReviewersEditorsAssigmentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EditorTableFilterComposer
    extends Composer<_$AppDatabase, $EditorTable> {
  $$EditorTableFilterComposer({
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

  $$UserTableFilterComposer get uid {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> chatRefs(
    Expression<bool> Function($$ChatTableFilterComposer f) f,
  ) {
    final $$ChatTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.editorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableFilterComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> requestReviewersEditorsAssigmentRefs(
    Expression<bool> Function(
      $$RequestReviewersEditorsAssigmentTableFilterComposer f,
    )
    f,
  ) {
    final $$RequestReviewersEditorsAssigmentTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.requestReviewersEditorsAssigment,
          getReferencedColumn: (t) => t.editorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RequestReviewersEditorsAssigmentTableFilterComposer(
                $db: $db,
                $table: $db.requestReviewersEditorsAssigment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EditorTableOrderingComposer
    extends Composer<_$AppDatabase, $EditorTable> {
  $$EditorTableOrderingComposer({
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

  $$UserTableOrderingComposer get uid {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EditorTableAnnotationComposer
    extends Composer<_$AppDatabase, $EditorTable> {
  $$EditorTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UserTableAnnotationComposer get uid {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> chatRefs<T extends Object>(
    Expression<T> Function($$ChatTableAnnotationComposer a) f,
  ) {
    final $$ChatTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.editorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableAnnotationComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> requestReviewersEditorsAssigmentRefs<T extends Object>(
    Expression<T> Function(
      $$RequestReviewersEditorsAssigmentTableAnnotationComposer a,
    )
    f,
  ) {
    final $$RequestReviewersEditorsAssigmentTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.requestReviewersEditorsAssigment,
          getReferencedColumn: (t) => t.editorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RequestReviewersEditorsAssigmentTableAnnotationComposer(
                $db: $db,
                $table: $db.requestReviewersEditorsAssigment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EditorTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EditorTable,
          EditorData,
          $$EditorTableFilterComposer,
          $$EditorTableOrderingComposer,
          $$EditorTableAnnotationComposer,
          $$EditorTableCreateCompanionBuilder,
          $$EditorTableUpdateCompanionBuilder,
          (EditorData, $$EditorTableReferences),
          EditorData,
          PrefetchHooks Function({
            bool uid,
            bool chatRefs,
            bool requestReviewersEditorsAssigmentRefs,
          })
        > {
  $$EditorTableTableManager(_$AppDatabase db, $EditorTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EditorTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EditorTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EditorTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> id = const Value.absent(),
              }) => EditorCompanion(uid: uid, id: id),
          createCompanionCallback:
              ({required String uid, Value<int> id = const Value.absent()}) =>
                  EditorCompanion.insert(uid: uid, id: id),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$EditorTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                uid = false,
                chatRefs = false,
                requestReviewersEditorsAssigmentRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (chatRefs) db.chat,
                    if (requestReviewersEditorsAssigmentRefs)
                      db.requestReviewersEditorsAssigment,
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
                                    referencedTable: $$EditorTableReferences
                                        ._uidTable(db),
                                    referencedColumn: $$EditorTableReferences
                                        ._uidTable(db)
                                        .uid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (chatRefs)
                        await $_getPrefetchedData<
                          EditorData,
                          $EditorTable,
                          ChatData
                        >(
                          currentTable: table,
                          referencedTable: $$EditorTableReferences
                              ._chatRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EditorTableReferences(db, table, p0).chatRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.editorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (requestReviewersEditorsAssigmentRefs)
                        await $_getPrefetchedData<
                          EditorData,
                          $EditorTable,
                          RequestReviewersEditorsAssigmentData
                        >(
                          currentTable: table,
                          referencedTable: $$EditorTableReferences
                              ._requestReviewersEditorsAssigmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EditorTableReferences(
                                db,
                                table,
                                p0,
                              ).requestReviewersEditorsAssigmentRefs,
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

typedef $$EditorTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EditorTable,
      EditorData,
      $$EditorTableFilterComposer,
      $$EditorTableOrderingComposer,
      $$EditorTableAnnotationComposer,
      $$EditorTableCreateCompanionBuilder,
      $$EditorTableUpdateCompanionBuilder,
      (EditorData, $$EditorTableReferences),
      EditorData,
      PrefetchHooks Function({
        bool uid,
        bool chatRefs,
        bool requestReviewersEditorsAssigmentRefs,
      })
    >;
typedef $$ReviewerTableCreateCompanionBuilder =
    ReviewerCompanion Function({required String uid, Value<int> id});
typedef $$ReviewerTableUpdateCompanionBuilder =
    ReviewerCompanion Function({Value<String> uid, Value<int> id});

final class $$ReviewerTableReferences
    extends BaseReferences<_$AppDatabase, $ReviewerTable, ReviewerData> {
  $$ReviewerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _uidTable(_$AppDatabase db) =>
      db.user.createAlias($_aliasNameGenerator(db.reviewer.uid, db.user.uid));

  $$UserTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChatTable, List<ChatData>> _chatRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chat,
    aliasName: $_aliasNameGenerator(db.reviewer.id, db.chat.reviewerId),
  );

  $$ChatTableProcessedTableManager get chatRefs {
    final manager = $$ChatTableTableManager(
      $_db,
      $_db.chat,
    ).filter((f) => f.reviewerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chatRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RequestReviewersEditorsAssigmentTable,
    List<RequestReviewersEditorsAssigmentData>
  >
  _requestReviewersEditorsAssigmentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.requestReviewersEditorsAssigment,
        aliasName: $_aliasNameGenerator(
          db.reviewer.id,
          db.requestReviewersEditorsAssigment.reviewerId,
        ),
      );

  $$RequestReviewersEditorsAssigmentTableProcessedTableManager
  get requestReviewersEditorsAssigmentRefs {
    final manager = $$RequestReviewersEditorsAssigmentTableTableManager(
      $_db,
      $_db.requestReviewersEditorsAssigment,
    ).filter((f) => f.reviewerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _requestReviewersEditorsAssigmentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReviewerTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewerTable> {
  $$ReviewerTableFilterComposer({
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

  $$UserTableFilterComposer get uid {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> chatRefs(
    Expression<bool> Function($$ChatTableFilterComposer f) f,
  ) {
    final $$ChatTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.reviewerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableFilterComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> requestReviewersEditorsAssigmentRefs(
    Expression<bool> Function(
      $$RequestReviewersEditorsAssigmentTableFilterComposer f,
    )
    f,
  ) {
    final $$RequestReviewersEditorsAssigmentTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.requestReviewersEditorsAssigment,
          getReferencedColumn: (t) => t.reviewerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RequestReviewersEditorsAssigmentTableFilterComposer(
                $db: $db,
                $table: $db.requestReviewersEditorsAssigment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ReviewerTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewerTable> {
  $$ReviewerTableOrderingComposer({
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

  $$UserTableOrderingComposer get uid {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewerTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewerTable> {
  $$ReviewerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UserTableAnnotationComposer get uid {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> chatRefs<T extends Object>(
    Expression<T> Function($$ChatTableAnnotationComposer a) f,
  ) {
    final $$ChatTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.reviewerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableAnnotationComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> requestReviewersEditorsAssigmentRefs<T extends Object>(
    Expression<T> Function(
      $$RequestReviewersEditorsAssigmentTableAnnotationComposer a,
    )
    f,
  ) {
    final $$RequestReviewersEditorsAssigmentTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.requestReviewersEditorsAssigment,
          getReferencedColumn: (t) => t.reviewerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RequestReviewersEditorsAssigmentTableAnnotationComposer(
                $db: $db,
                $table: $db.requestReviewersEditorsAssigment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ReviewerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewerTable,
          ReviewerData,
          $$ReviewerTableFilterComposer,
          $$ReviewerTableOrderingComposer,
          $$ReviewerTableAnnotationComposer,
          $$ReviewerTableCreateCompanionBuilder,
          $$ReviewerTableUpdateCompanionBuilder,
          (ReviewerData, $$ReviewerTableReferences),
          ReviewerData,
          PrefetchHooks Function({
            bool uid,
            bool chatRefs,
            bool requestReviewersEditorsAssigmentRefs,
          })
        > {
  $$ReviewerTableTableManager(_$AppDatabase db, $ReviewerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> id = const Value.absent(),
              }) => ReviewerCompanion(uid: uid, id: id),
          createCompanionCallback:
              ({required String uid, Value<int> id = const Value.absent()}) =>
                  ReviewerCompanion.insert(uid: uid, id: id),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReviewerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                uid = false,
                chatRefs = false,
                requestReviewersEditorsAssigmentRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (chatRefs) db.chat,
                    if (requestReviewersEditorsAssigmentRefs)
                      db.requestReviewersEditorsAssigment,
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
                                    referencedTable: $$ReviewerTableReferences
                                        ._uidTable(db),
                                    referencedColumn: $$ReviewerTableReferences
                                        ._uidTable(db)
                                        .uid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (chatRefs)
                        await $_getPrefetchedData<
                          ReviewerData,
                          $ReviewerTable,
                          ChatData
                        >(
                          currentTable: table,
                          referencedTable: $$ReviewerTableReferences
                              ._chatRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReviewerTableReferences(db, table, p0).chatRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reviewerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (requestReviewersEditorsAssigmentRefs)
                        await $_getPrefetchedData<
                          ReviewerData,
                          $ReviewerTable,
                          RequestReviewersEditorsAssigmentData
                        >(
                          currentTable: table,
                          referencedTable: $$ReviewerTableReferences
                              ._requestReviewersEditorsAssigmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReviewerTableReferences(
                                db,
                                table,
                                p0,
                              ).requestReviewersEditorsAssigmentRefs,
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

typedef $$ReviewerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewerTable,
      ReviewerData,
      $$ReviewerTableFilterComposer,
      $$ReviewerTableOrderingComposer,
      $$ReviewerTableAnnotationComposer,
      $$ReviewerTableCreateCompanionBuilder,
      $$ReviewerTableUpdateCompanionBuilder,
      (ReviewerData, $$ReviewerTableReferences),
      ReviewerData,
      PrefetchHooks Function({
        bool uid,
        bool chatRefs,
        bool requestReviewersEditorsAssigmentRefs,
      })
    >;
typedef $$AdminTableCreateCompanionBuilder =
    AdminCompanion Function({required String uid, Value<int> id});
typedef $$AdminTableUpdateCompanionBuilder =
    AdminCompanion Function({Value<String> uid, Value<int> id});

final class $$AdminTableReferences
    extends BaseReferences<_$AppDatabase, $AdminTable, AdminData> {
  $$AdminTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _uidTable(_$AppDatabase db) =>
      db.user.createAlias($_aliasNameGenerator(db.admin.uid, db.user.uid));

  $$UserTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
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

  $$UserTableFilterComposer get uid {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
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

  $$UserTableOrderingComposer get uid {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
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

  $$UserTableAnnotationComposer get uid {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
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
              }) => AdminCompanion(uid: uid, id: id),
          createCompanionCallback:
              ({required String uid, Value<int> id = const Value.absent()}) =>
                  AdminCompanion.insert(uid: uid, id: id),
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
typedef $$ConferenceTableCreateCompanionBuilder =
    ConferenceCompanion Function({
      Value<int> id,
      required String title,
      required String shortDescription,
      required DateTime startConferenceDate,
      Value<DateTime?> endConferenceDate,
      required String address,
      Value<List<ConferenceFormat>?> conferenceFormat,
      required DateTime submissionStartDate,
      required DateTime submissionEndDate,
      required int quantityOfPages,
      Value<List<FileFormat>?> fileFormat,
      required String requirements,
    });
typedef $$ConferenceTableUpdateCompanionBuilder =
    ConferenceCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> shortDescription,
      Value<DateTime> startConferenceDate,
      Value<DateTime?> endConferenceDate,
      Value<String> address,
      Value<List<ConferenceFormat>?> conferenceFormat,
      Value<DateTime> submissionStartDate,
      Value<DateTime> submissionEndDate,
      Value<int> quantityOfPages,
      Value<List<FileFormat>?> fileFormat,
      Value<String> requirements,
    });

final class $$ConferenceTableReferences
    extends BaseReferences<_$AppDatabase, $ConferenceTable, ConferenceData> {
  $$ConferenceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RequestTable, List<RequestData>>
  _requestRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.request,
    aliasName: $_aliasNameGenerator(db.conference.id, db.request.conferenceId),
  );

  $$RequestTableProcessedTableManager get requestRefs {
    final manager = $$RequestTableTableManager(
      $_db,
      $_db.request,
    ).filter((f) => f.conferenceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConferenceTableFilterComposer
    extends Composer<_$AppDatabase, $ConferenceTable> {
  $$ConferenceTableFilterComposer({
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

  ColumnFilters<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startConferenceDate => $composableBuilder(
    column: $table.startConferenceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endConferenceDate => $composableBuilder(
    column: $table.endConferenceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<ConferenceFormat>?,
    List<ConferenceFormat>,
    String
  >
  get conferenceFormat => $composableBuilder(
    column: $table.conferenceFormat,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get submissionStartDate => $composableBuilder(
    column: $table.submissionStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get submissionEndDate => $composableBuilder(
    column: $table.submissionEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantityOfPages => $composableBuilder(
    column: $table.quantityOfPages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<FileFormat>?, List<FileFormat>, String>
  get fileFormat => $composableBuilder(
    column: $table.fileFormat,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get requirements => $composableBuilder(
    column: $table.requirements,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> requestRefs(
    Expression<bool> Function($$RequestTableFilterComposer f) f,
  ) {
    final $$RequestTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.conferenceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableFilterComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConferenceTableOrderingComposer
    extends Composer<_$AppDatabase, $ConferenceTable> {
  $$ConferenceTableOrderingComposer({
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

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startConferenceDate => $composableBuilder(
    column: $table.startConferenceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endConferenceDate => $composableBuilder(
    column: $table.endConferenceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conferenceFormat => $composableBuilder(
    column: $table.conferenceFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get submissionStartDate => $composableBuilder(
    column: $table.submissionStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get submissionEndDate => $composableBuilder(
    column: $table.submissionEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantityOfPages => $composableBuilder(
    column: $table.quantityOfPages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileFormat => $composableBuilder(
    column: $table.fileFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requirements => $composableBuilder(
    column: $table.requirements,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConferenceTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConferenceTable> {
  $$ConferenceTableAnnotationComposer({
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

  GeneratedColumn<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startConferenceDate => $composableBuilder(
    column: $table.startConferenceDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get endConferenceDate => $composableBuilder(
    column: $table.endConferenceDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ConferenceFormat>?, String>
  get conferenceFormat => $composableBuilder(
    column: $table.conferenceFormat,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get submissionStartDate => $composableBuilder(
    column: $table.submissionStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get submissionEndDate => $composableBuilder(
    column: $table.submissionEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantityOfPages => $composableBuilder(
    column: $table.quantityOfPages,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<FileFormat>?, String> get fileFormat =>
      $composableBuilder(
        column: $table.fileFormat,
        builder: (column) => column,
      );

  GeneratedColumn<String> get requirements => $composableBuilder(
    column: $table.requirements,
    builder: (column) => column,
  );

  Expression<T> requestRefs<T extends Object>(
    Expression<T> Function($$RequestTableAnnotationComposer a) f,
  ) {
    final $$RequestTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.conferenceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableAnnotationComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConferenceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConferenceTable,
          ConferenceData,
          $$ConferenceTableFilterComposer,
          $$ConferenceTableOrderingComposer,
          $$ConferenceTableAnnotationComposer,
          $$ConferenceTableCreateCompanionBuilder,
          $$ConferenceTableUpdateCompanionBuilder,
          (ConferenceData, $$ConferenceTableReferences),
          ConferenceData,
          PrefetchHooks Function({bool requestRefs})
        > {
  $$ConferenceTableTableManager(_$AppDatabase db, $ConferenceTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConferenceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConferenceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConferenceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> shortDescription = const Value.absent(),
                Value<DateTime> startConferenceDate = const Value.absent(),
                Value<DateTime?> endConferenceDate = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<List<ConferenceFormat>?> conferenceFormat =
                    const Value.absent(),
                Value<DateTime> submissionStartDate = const Value.absent(),
                Value<DateTime> submissionEndDate = const Value.absent(),
                Value<int> quantityOfPages = const Value.absent(),
                Value<List<FileFormat>?> fileFormat = const Value.absent(),
                Value<String> requirements = const Value.absent(),
              }) => ConferenceCompanion(
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
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String shortDescription,
                required DateTime startConferenceDate,
                Value<DateTime?> endConferenceDate = const Value.absent(),
                required String address,
                Value<List<ConferenceFormat>?> conferenceFormat =
                    const Value.absent(),
                required DateTime submissionStartDate,
                required DateTime submissionEndDate,
                required int quantityOfPages,
                Value<List<FileFormat>?> fileFormat = const Value.absent(),
                required String requirements,
              }) => ConferenceCompanion.insert(
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
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConferenceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({requestRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (requestRefs) db.request],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (requestRefs)
                    await $_getPrefetchedData<
                      ConferenceData,
                      $ConferenceTable,
                      RequestData
                    >(
                      currentTable: table,
                      referencedTable: $$ConferenceTableReferences
                          ._requestRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ConferenceTableReferences(
                            db,
                            table,
                            p0,
                          ).requestRefs,
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

typedef $$ConferenceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConferenceTable,
      ConferenceData,
      $$ConferenceTableFilterComposer,
      $$ConferenceTableOrderingComposer,
      $$ConferenceTableAnnotationComposer,
      $$ConferenceTableCreateCompanionBuilder,
      $$ConferenceTableUpdateCompanionBuilder,
      (ConferenceData, $$ConferenceTableReferences),
      ConferenceData,
      PrefetchHooks Function({bool requestRefs})
    >;
typedef $$SectionTableCreateCompanionBuilder =
    SectionCompanion Function({Value<int> id, required String title});
typedef $$SectionTableUpdateCompanionBuilder =
    SectionCompanion Function({Value<int> id, Value<String> title});

final class $$SectionTableReferences
    extends BaseReferences<_$AppDatabase, $SectionTable, SectionData> {
  $$SectionTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RequestTable, List<RequestData>>
  _requestRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.request,
    aliasName: $_aliasNameGenerator(db.section.id, db.request.sectionId),
  );

  $$RequestTableProcessedTableManager get requestRefs {
    final manager = $$RequestTableTableManager(
      $_db,
      $_db.request,
    ).filter((f) => f.sectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SectionTableFilterComposer
    extends Composer<_$AppDatabase, $SectionTable> {
  $$SectionTableFilterComposer({
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

  Expression<bool> requestRefs(
    Expression<bool> Function($$RequestTableFilterComposer f) f,
  ) {
    final $$RequestTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.sectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableFilterComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SectionTableOrderingComposer
    extends Composer<_$AppDatabase, $SectionTable> {
  $$SectionTableOrderingComposer({
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

class $$SectionTableAnnotationComposer
    extends Composer<_$AppDatabase, $SectionTable> {
  $$SectionTableAnnotationComposer({
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

  Expression<T> requestRefs<T extends Object>(
    Expression<T> Function($$RequestTableAnnotationComposer a) f,
  ) {
    final $$RequestTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.sectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableAnnotationComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SectionTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SectionTable,
          SectionData,
          $$SectionTableFilterComposer,
          $$SectionTableOrderingComposer,
          $$SectionTableAnnotationComposer,
          $$SectionTableCreateCompanionBuilder,
          $$SectionTableUpdateCompanionBuilder,
          (SectionData, $$SectionTableReferences),
          SectionData,
          PrefetchHooks Function({bool requestRefs})
        > {
  $$SectionTableTableManager(_$AppDatabase db, $SectionTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
              }) => SectionCompanion(id: id, title: title),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String title}) =>
                  SectionCompanion.insert(id: id, title: title),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SectionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({requestRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (requestRefs) db.request],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (requestRefs)
                    await $_getPrefetchedData<
                      SectionData,
                      $SectionTable,
                      RequestData
                    >(
                      currentTable: table,
                      referencedTable: $$SectionTableReferences
                          ._requestRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SectionTableReferences(db, table, p0).requestRefs,
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

typedef $$SectionTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SectionTable,
      SectionData,
      $$SectionTableFilterComposer,
      $$SectionTableOrderingComposer,
      $$SectionTableAnnotationComposer,
      $$SectionTableCreateCompanionBuilder,
      $$SectionTableUpdateCompanionBuilder,
      (SectionData, $$SectionTableReferences),
      SectionData,
      PrefetchHooks Function({bool requestRefs})
    >;
typedef $$ChatTableCreateCompanionBuilder =
    ChatCompanion Function({
      Value<int> id,
      required int authorId,
      required int editorId,
      required int reviewerId,
    });
typedef $$ChatTableUpdateCompanionBuilder =
    ChatCompanion Function({
      Value<int> id,
      Value<int> authorId,
      Value<int> editorId,
      Value<int> reviewerId,
    });

final class $$ChatTableReferences
    extends BaseReferences<_$AppDatabase, $ChatTable, ChatData> {
  $$ChatTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuthorTable _authorIdTable(_$AppDatabase db) => db.author.createAlias(
    $_aliasNameGenerator(db.chat.authorId, db.author.id),
  );

  $$AuthorTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager = $$AuthorTableTableManager(
      $_db,
      $_db.author,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EditorTable _editorIdTable(_$AppDatabase db) => db.editor.createAlias(
    $_aliasNameGenerator(db.chat.editorId, db.editor.id),
  );

  $$EditorTableProcessedTableManager get editorId {
    final $_column = $_itemColumn<int>('editor_id')!;

    final manager = $$EditorTableTableManager(
      $_db,
      $_db.editor,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_editorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ReviewerTable _reviewerIdTable(_$AppDatabase db) => db.reviewer
      .createAlias($_aliasNameGenerator(db.chat.reviewerId, db.reviewer.id));

  $$ReviewerTableProcessedTableManager get reviewerId {
    final $_column = $_itemColumn<int>('reviewer_id')!;

    final manager = $$ReviewerTableTableManager(
      $_db,
      $_db.reviewer,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reviewerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RequestTable, List<RequestData>>
  _requestRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.request,
    aliasName: $_aliasNameGenerator(db.chat.id, db.request.chatId),
  );

  $$RequestTableProcessedTableManager get requestRefs {
    final manager = $$RequestTableTableManager(
      $_db,
      $_db.request,
    ).filter((f) => f.chatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MessageTable, List<MessageData>>
  _messageRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.message,
    aliasName: $_aliasNameGenerator(db.chat.id, db.message.chatId),
  );

  $$MessageTableProcessedTableManager get messageRefs {
    final manager = $$MessageTableTableManager(
      $_db,
      $_db.message,
    ).filter((f) => f.chatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messageRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChatTableFilterComposer extends Composer<_$AppDatabase, $ChatTable> {
  $$ChatTableFilterComposer({
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

  $$AuthorTableFilterComposer get authorId {
    final $$AuthorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableFilterComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorTableFilterComposer get editorId {
    final $$EditorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableFilterComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewerTableFilterComposer get reviewerId {
    final $$ReviewerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableFilterComposer(
            $db: $db,
            $table: $db.reviewer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> requestRefs(
    Expression<bool> Function($$RequestTableFilterComposer f) f,
  ) {
    final $$RequestTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableFilterComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> messageRefs(
    Expression<bool> Function($$MessageTableFilterComposer f) f,
  ) {
    final $$MessageTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.message,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageTableFilterComposer(
            $db: $db,
            $table: $db.message,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChatTableOrderingComposer extends Composer<_$AppDatabase, $ChatTable> {
  $$ChatTableOrderingComposer({
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

  $$AuthorTableOrderingComposer get authorId {
    final $$AuthorTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableOrderingComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorTableOrderingComposer get editorId {
    final $$EditorTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableOrderingComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewerTableOrderingComposer get reviewerId {
    final $$ReviewerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableOrderingComposer(
            $db: $db,
            $table: $db.reviewer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatTable> {
  $$ChatTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$AuthorTableAnnotationComposer get authorId {
    final $$AuthorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableAnnotationComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorTableAnnotationComposer get editorId {
    final $$EditorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableAnnotationComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewerTableAnnotationComposer get reviewerId {
    final $$ReviewerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> requestRefs<T extends Object>(
    Expression<T> Function($$RequestTableAnnotationComposer a) f,
  ) {
    final $$RequestTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableAnnotationComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> messageRefs<T extends Object>(
    Expression<T> Function($$MessageTableAnnotationComposer a) f,
  ) {
    final $$MessageTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.message,
      getReferencedColumn: (t) => t.chatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageTableAnnotationComposer(
            $db: $db,
            $table: $db.message,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChatTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatTable,
          ChatData,
          $$ChatTableFilterComposer,
          $$ChatTableOrderingComposer,
          $$ChatTableAnnotationComposer,
          $$ChatTableCreateCompanionBuilder,
          $$ChatTableUpdateCompanionBuilder,
          (ChatData, $$ChatTableReferences),
          ChatData,
          PrefetchHooks Function({
            bool authorId,
            bool editorId,
            bool reviewerId,
            bool requestRefs,
            bool messageRefs,
          })
        > {
  $$ChatTableTableManager(_$AppDatabase db, $ChatTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> authorId = const Value.absent(),
                Value<int> editorId = const Value.absent(),
                Value<int> reviewerId = const Value.absent(),
              }) => ChatCompanion(
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
              }) => ChatCompanion.insert(
                id: id,
                authorId: authorId,
                editorId: editorId,
                reviewerId: reviewerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ChatTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                authorId = false,
                editorId = false,
                reviewerId = false,
                requestRefs = false,
                messageRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (requestRefs) db.request,
                    if (messageRefs) db.message,
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
                                    referencedTable: $$ChatTableReferences
                                        ._authorIdTable(db),
                                    referencedColumn: $$ChatTableReferences
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
                                    referencedTable: $$ChatTableReferences
                                        ._editorIdTable(db),
                                    referencedColumn: $$ChatTableReferences
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
                                    referencedTable: $$ChatTableReferences
                                        ._reviewerIdTable(db),
                                    referencedColumn: $$ChatTableReferences
                                        ._reviewerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (requestRefs)
                        await $_getPrefetchedData<
                          ChatData,
                          $ChatTable,
                          RequestData
                        >(
                          currentTable: table,
                          referencedTable: $$ChatTableReferences
                              ._requestRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChatTableReferences(db, table, p0).requestRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.chatId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (messageRefs)
                        await $_getPrefetchedData<
                          ChatData,
                          $ChatTable,
                          MessageData
                        >(
                          currentTable: table,
                          referencedTable: $$ChatTableReferences
                              ._messageRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChatTableReferences(db, table, p0).messageRefs,
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

typedef $$ChatTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatTable,
      ChatData,
      $$ChatTableFilterComposer,
      $$ChatTableOrderingComposer,
      $$ChatTableAnnotationComposer,
      $$ChatTableCreateCompanionBuilder,
      $$ChatTableUpdateCompanionBuilder,
      (ChatData, $$ChatTableReferences),
      ChatData,
      PrefetchHooks Function({
        bool authorId,
        bool editorId,
        bool reviewerId,
        bool requestRefs,
        bool messageRefs,
      })
    >;
typedef $$RequestTableCreateCompanionBuilder =
    RequestCompanion Function({
      Value<int> id,
      required int authorId,
      required int conferenceId,
      required int sectionId,
      Value<String?> coAuthors,
      required String title,
      required String status,
      Value<String?> comment,
      Value<int?> chatId,
      required DateTime createdAt,
    });
typedef $$RequestTableUpdateCompanionBuilder =
    RequestCompanion Function({
      Value<int> id,
      Value<int> authorId,
      Value<int> conferenceId,
      Value<int> sectionId,
      Value<String?> coAuthors,
      Value<String> title,
      Value<String> status,
      Value<String?> comment,
      Value<int?> chatId,
      Value<DateTime> createdAt,
    });

final class $$RequestTableReferences
    extends BaseReferences<_$AppDatabase, $RequestTable, RequestData> {
  $$RequestTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuthorTable _authorIdTable(_$AppDatabase db) => db.author.createAlias(
    $_aliasNameGenerator(db.request.authorId, db.author.id),
  );

  $$AuthorTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager = $$AuthorTableTableManager(
      $_db,
      $_db.author,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ConferenceTable _conferenceIdTable(_$AppDatabase db) =>
      db.conference.createAlias(
        $_aliasNameGenerator(db.request.conferenceId, db.conference.id),
      );

  $$ConferenceTableProcessedTableManager get conferenceId {
    final $_column = $_itemColumn<int>('conference_id')!;

    final manager = $$ConferenceTableTableManager(
      $_db,
      $_db.conference,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_conferenceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SectionTable _sectionIdTable(_$AppDatabase db) => db.section
      .createAlias($_aliasNameGenerator(db.request.sectionId, db.section.id));

  $$SectionTableProcessedTableManager get sectionId {
    final $_column = $_itemColumn<int>('section_id')!;

    final manager = $$SectionTableTableManager(
      $_db,
      $_db.section,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChatTable _chatIdTable(_$AppDatabase db) =>
      db.chat.createAlias($_aliasNameGenerator(db.request.chatId, db.chat.id));

  $$ChatTableProcessedTableManager? get chatId {
    final $_column = $_itemColumn<int>('chat_id');
    if ($_column == null) return null;
    final manager = $$ChatTableTableManager(
      $_db,
      $_db.chat,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RequestReviewersEditorsAssigmentTable,
    List<RequestReviewersEditorsAssigmentData>
  >
  _requestReviewersEditorsAssigmentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.requestReviewersEditorsAssigment,
        aliasName: $_aliasNameGenerator(
          db.request.id,
          db.requestReviewersEditorsAssigment.requestId,
        ),
      );

  $$RequestReviewersEditorsAssigmentTableProcessedTableManager
  get requestReviewersEditorsAssigmentRefs {
    final manager = $$RequestReviewersEditorsAssigmentTableTableManager(
      $_db,
      $_db.requestReviewersEditorsAssigment,
    ).filter((f) => f.requestId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _requestReviewersEditorsAssigmentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RequestTableFilterComposer
    extends Composer<_$AppDatabase, $RequestTable> {
  $$RequestTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AuthorTableFilterComposer get authorId {
    final $$AuthorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableFilterComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConferenceTableFilterComposer get conferenceId {
    final $$ConferenceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conferenceId,
      referencedTable: $db.conference,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConferenceTableFilterComposer(
            $db: $db,
            $table: $db.conference,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SectionTableFilterComposer get sectionId {
    final $$SectionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.section,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionTableFilterComposer(
            $db: $db,
            $table: $db.section,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChatTableFilterComposer get chatId {
    final $$ChatTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableFilterComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> requestReviewersEditorsAssigmentRefs(
    Expression<bool> Function(
      $$RequestReviewersEditorsAssigmentTableFilterComposer f,
    )
    f,
  ) {
    final $$RequestReviewersEditorsAssigmentTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.requestReviewersEditorsAssigment,
          getReferencedColumn: (t) => t.requestId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RequestReviewersEditorsAssigmentTableFilterComposer(
                $db: $db,
                $table: $db.requestReviewersEditorsAssigment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RequestTableOrderingComposer
    extends Composer<_$AppDatabase, $RequestTable> {
  $$RequestTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AuthorTableOrderingComposer get authorId {
    final $$AuthorTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableOrderingComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConferenceTableOrderingComposer get conferenceId {
    final $$ConferenceTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conferenceId,
      referencedTable: $db.conference,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConferenceTableOrderingComposer(
            $db: $db,
            $table: $db.conference,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SectionTableOrderingComposer get sectionId {
    final $$SectionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.section,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionTableOrderingComposer(
            $db: $db,
            $table: $db.section,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChatTableOrderingComposer get chatId {
    final $$ChatTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableOrderingComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestTableAnnotationComposer
    extends Composer<_$AppDatabase, $RequestTable> {
  $$RequestTableAnnotationComposer({
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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AuthorTableAnnotationComposer get authorId {
    final $$AuthorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableAnnotationComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConferenceTableAnnotationComposer get conferenceId {
    final $$ConferenceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conferenceId,
      referencedTable: $db.conference,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConferenceTableAnnotationComposer(
            $db: $db,
            $table: $db.conference,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SectionTableAnnotationComposer get sectionId {
    final $$SectionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.section,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionTableAnnotationComposer(
            $db: $db,
            $table: $db.section,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChatTableAnnotationComposer get chatId {
    final $$ChatTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableAnnotationComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> requestReviewersEditorsAssigmentRefs<T extends Object>(
    Expression<T> Function(
      $$RequestReviewersEditorsAssigmentTableAnnotationComposer a,
    )
    f,
  ) {
    final $$RequestReviewersEditorsAssigmentTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.requestReviewersEditorsAssigment,
          getReferencedColumn: (t) => t.requestId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RequestReviewersEditorsAssigmentTableAnnotationComposer(
                $db: $db,
                $table: $db.requestReviewersEditorsAssigment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RequestTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RequestTable,
          RequestData,
          $$RequestTableFilterComposer,
          $$RequestTableOrderingComposer,
          $$RequestTableAnnotationComposer,
          $$RequestTableCreateCompanionBuilder,
          $$RequestTableUpdateCompanionBuilder,
          (RequestData, $$RequestTableReferences),
          RequestData,
          PrefetchHooks Function({
            bool authorId,
            bool conferenceId,
            bool sectionId,
            bool chatId,
            bool requestReviewersEditorsAssigmentRefs,
          })
        > {
  $$RequestTableTableManager(_$AppDatabase db, $RequestTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequestTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RequestTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RequestTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> authorId = const Value.absent(),
                Value<int> conferenceId = const Value.absent(),
                Value<int> sectionId = const Value.absent(),
                Value<String?> coAuthors = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int?> chatId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RequestCompanion(
                id: id,
                authorId: authorId,
                conferenceId: conferenceId,
                sectionId: sectionId,
                coAuthors: coAuthors,
                title: title,
                status: status,
                comment: comment,
                chatId: chatId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int authorId,
                required int conferenceId,
                required int sectionId,
                Value<String?> coAuthors = const Value.absent(),
                required String title,
                required String status,
                Value<String?> comment = const Value.absent(),
                Value<int?> chatId = const Value.absent(),
                required DateTime createdAt,
              }) => RequestCompanion.insert(
                id: id,
                authorId: authorId,
                conferenceId: conferenceId,
                sectionId: sectionId,
                coAuthors: coAuthors,
                title: title,
                status: status,
                comment: comment,
                chatId: chatId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RequestTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                authorId = false,
                conferenceId = false,
                sectionId = false,
                chatId = false,
                requestReviewersEditorsAssigmentRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (requestReviewersEditorsAssigmentRefs)
                      db.requestReviewersEditorsAssigment,
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
                                    referencedTable: $$RequestTableReferences
                                        ._authorIdTable(db),
                                    referencedColumn: $$RequestTableReferences
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
                                    referencedTable: $$RequestTableReferences
                                        ._conferenceIdTable(db),
                                    referencedColumn: $$RequestTableReferences
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
                                    referencedTable: $$RequestTableReferences
                                        ._sectionIdTable(db),
                                    referencedColumn: $$RequestTableReferences
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
                                    referencedTable: $$RequestTableReferences
                                        ._chatIdTable(db),
                                    referencedColumn: $$RequestTableReferences
                                        ._chatIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (requestReviewersEditorsAssigmentRefs)
                        await $_getPrefetchedData<
                          RequestData,
                          $RequestTable,
                          RequestReviewersEditorsAssigmentData
                        >(
                          currentTable: table,
                          referencedTable: $$RequestTableReferences
                              ._requestReviewersEditorsAssigmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RequestTableReferences(
                                db,
                                table,
                                p0,
                              ).requestReviewersEditorsAssigmentRefs,
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

typedef $$RequestTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RequestTable,
      RequestData,
      $$RequestTableFilterComposer,
      $$RequestTableOrderingComposer,
      $$RequestTableAnnotationComposer,
      $$RequestTableCreateCompanionBuilder,
      $$RequestTableUpdateCompanionBuilder,
      (RequestData, $$RequestTableReferences),
      RequestData,
      PrefetchHooks Function({
        bool authorId,
        bool conferenceId,
        bool sectionId,
        bool chatId,
        bool requestReviewersEditorsAssigmentRefs,
      })
    >;
typedef $$MessageTableCreateCompanionBuilder =
    MessageCompanion Function({
      Value<int> id,
      required int chatId,
      required String messageText,
      required String uid,
    });
typedef $$MessageTableUpdateCompanionBuilder =
    MessageCompanion Function({
      Value<int> id,
      Value<int> chatId,
      Value<String> messageText,
      Value<String> uid,
    });

final class $$MessageTableReferences
    extends BaseReferences<_$AppDatabase, $MessageTable, MessageData> {
  $$MessageTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChatTable _chatIdTable(_$AppDatabase db) =>
      db.chat.createAlias($_aliasNameGenerator(db.message.chatId, db.chat.id));

  $$ChatTableProcessedTableManager get chatId {
    final $_column = $_itemColumn<int>('chat_id')!;

    final manager = $$ChatTableTableManager(
      $_db,
      $_db.chat,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserTable _uidTable(_$AppDatabase db) =>
      db.user.createAlias($_aliasNameGenerator(db.message.uid, db.user.uid));

  $$UserTableProcessedTableManager get uid {
    final $_column = $_itemColumn<String>('uid')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MessageTableFilterComposer
    extends Composer<_$AppDatabase, $MessageTable> {
  $$MessageTableFilterComposer({
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

  $$ChatTableFilterComposer get chatId {
    final $$ChatTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableFilterComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableFilterComposer get uid {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageTableOrderingComposer
    extends Composer<_$AppDatabase, $MessageTable> {
  $$MessageTableOrderingComposer({
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

  $$ChatTableOrderingComposer get chatId {
    final $$ChatTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableOrderingComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableOrderingComposer get uid {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessageTable> {
  $$MessageTableAnnotationComposer({
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

  $$ChatTableAnnotationComposer get chatId {
    final $$ChatTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chatId,
      referencedTable: $db.chat,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatTableAnnotationComposer(
            $db: $db,
            $table: $db.chat,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableAnnotationComposer get uid {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MessageTable,
          MessageData,
          $$MessageTableFilterComposer,
          $$MessageTableOrderingComposer,
          $$MessageTableAnnotationComposer,
          $$MessageTableCreateCompanionBuilder,
          $$MessageTableUpdateCompanionBuilder,
          (MessageData, $$MessageTableReferences),
          MessageData,
          PrefetchHooks Function({bool chatId, bool uid})
        > {
  $$MessageTableTableManager(_$AppDatabase db, $MessageTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessageTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessageTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessageTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> chatId = const Value.absent(),
                Value<String> messageText = const Value.absent(),
                Value<String> uid = const Value.absent(),
              }) => MessageCompanion(
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
              }) => MessageCompanion.insert(
                id: id,
                chatId: chatId,
                messageText: messageText,
                uid: uid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MessageTableReferences(db, table, e),
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
                                referencedTable: $$MessageTableReferences
                                    ._chatIdTable(db),
                                referencedColumn: $$MessageTableReferences
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
                                referencedTable: $$MessageTableReferences
                                    ._uidTable(db),
                                referencedColumn: $$MessageTableReferences
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

typedef $$MessageTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MessageTable,
      MessageData,
      $$MessageTableFilterComposer,
      $$MessageTableOrderingComposer,
      $$MessageTableAnnotationComposer,
      $$MessageTableCreateCompanionBuilder,
      $$MessageTableUpdateCompanionBuilder,
      (MessageData, $$MessageTableReferences),
      MessageData,
      PrefetchHooks Function({bool chatId, bool uid})
    >;
typedef $$RequestReviewersEditorsAssigmentTableCreateCompanionBuilder =
    RequestReviewersEditorsAssigmentCompanion Function({
      Value<int> id,
      required int requestId,
      required int editorId,
      required int reviewerId,
    });
typedef $$RequestReviewersEditorsAssigmentTableUpdateCompanionBuilder =
    RequestReviewersEditorsAssigmentCompanion Function({
      Value<int> id,
      Value<int> requestId,
      Value<int> editorId,
      Value<int> reviewerId,
    });

final class $$RequestReviewersEditorsAssigmentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RequestReviewersEditorsAssigmentTable,
          RequestReviewersEditorsAssigmentData
        > {
  $$RequestReviewersEditorsAssigmentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RequestTable _requestIdTable(_$AppDatabase db) =>
      db.request.createAlias(
        $_aliasNameGenerator(
          db.requestReviewersEditorsAssigment.requestId,
          db.request.id,
        ),
      );

  $$RequestTableProcessedTableManager get requestId {
    final $_column = $_itemColumn<int>('request_id')!;

    final manager = $$RequestTableTableManager(
      $_db,
      $_db.request,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_requestIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EditorTable _editorIdTable(_$AppDatabase db) => db.editor.createAlias(
    $_aliasNameGenerator(
      db.requestReviewersEditorsAssigment.editorId,
      db.editor.id,
    ),
  );

  $$EditorTableProcessedTableManager get editorId {
    final $_column = $_itemColumn<int>('editor_id')!;

    final manager = $$EditorTableTableManager(
      $_db,
      $_db.editor,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_editorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ReviewerTable _reviewerIdTable(_$AppDatabase db) =>
      db.reviewer.createAlias(
        $_aliasNameGenerator(
          db.requestReviewersEditorsAssigment.reviewerId,
          db.reviewer.id,
        ),
      );

  $$ReviewerTableProcessedTableManager get reviewerId {
    final $_column = $_itemColumn<int>('reviewer_id')!;

    final manager = $$ReviewerTableTableManager(
      $_db,
      $_db.reviewer,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reviewerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RequestReviewersEditorsAssigmentTableFilterComposer
    extends Composer<_$AppDatabase, $RequestReviewersEditorsAssigmentTable> {
  $$RequestReviewersEditorsAssigmentTableFilterComposer({
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

  $$RequestTableFilterComposer get requestId {
    final $$RequestTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableFilterComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorTableFilterComposer get editorId {
    final $$EditorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableFilterComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewerTableFilterComposer get reviewerId {
    final $$ReviewerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableFilterComposer(
            $db: $db,
            $table: $db.reviewer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestReviewersEditorsAssigmentTableOrderingComposer
    extends Composer<_$AppDatabase, $RequestReviewersEditorsAssigmentTable> {
  $$RequestReviewersEditorsAssigmentTableOrderingComposer({
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

  $$RequestTableOrderingComposer get requestId {
    final $$RequestTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableOrderingComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorTableOrderingComposer get editorId {
    final $$EditorTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableOrderingComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewerTableOrderingComposer get reviewerId {
    final $$ReviewerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableOrderingComposer(
            $db: $db,
            $table: $db.reviewer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestReviewersEditorsAssigmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $RequestReviewersEditorsAssigmentTable> {
  $$RequestReviewersEditorsAssigmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$RequestTableAnnotationComposer get requestId {
    final $$RequestTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.request,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestTableAnnotationComposer(
            $db: $db,
            $table: $db.request,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EditorTableAnnotationComposer get editorId {
    final $$EditorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.editorId,
      referencedTable: $db.editor,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EditorTableAnnotationComposer(
            $db: $db,
            $table: $db.editor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReviewerTableAnnotationComposer get reviewerId {
    final $$ReviewerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewerId,
      referencedTable: $db.reviewer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewerTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestReviewersEditorsAssigmentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RequestReviewersEditorsAssigmentTable,
          RequestReviewersEditorsAssigmentData,
          $$RequestReviewersEditorsAssigmentTableFilterComposer,
          $$RequestReviewersEditorsAssigmentTableOrderingComposer,
          $$RequestReviewersEditorsAssigmentTableAnnotationComposer,
          $$RequestReviewersEditorsAssigmentTableCreateCompanionBuilder,
          $$RequestReviewersEditorsAssigmentTableUpdateCompanionBuilder,
          (
            RequestReviewersEditorsAssigmentData,
            $$RequestReviewersEditorsAssigmentTableReferences,
          ),
          RequestReviewersEditorsAssigmentData,
          PrefetchHooks Function({
            bool requestId,
            bool editorId,
            bool reviewerId,
          })
        > {
  $$RequestReviewersEditorsAssigmentTableTableManager(
    _$AppDatabase db,
    $RequestReviewersEditorsAssigmentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequestReviewersEditorsAssigmentTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RequestReviewersEditorsAssigmentTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RequestReviewersEditorsAssigmentTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> requestId = const Value.absent(),
                Value<int> editorId = const Value.absent(),
                Value<int> reviewerId = const Value.absent(),
              }) => RequestReviewersEditorsAssigmentCompanion(
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
              }) => RequestReviewersEditorsAssigmentCompanion.insert(
                id: id,
                requestId: requestId,
                editorId: editorId,
                reviewerId: reviewerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RequestReviewersEditorsAssigmentTableReferences(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({requestId = false, editorId = false, reviewerId = false}) {
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
                                referencedTable:
                                    $$RequestReviewersEditorsAssigmentTableReferences
                                        ._requestIdTable(db),
                                referencedColumn:
                                    $$RequestReviewersEditorsAssigmentTableReferences
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
                                referencedTable:
                                    $$RequestReviewersEditorsAssigmentTableReferences
                                        ._editorIdTable(db),
                                referencedColumn:
                                    $$RequestReviewersEditorsAssigmentTableReferences
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
                                referencedTable:
                                    $$RequestReviewersEditorsAssigmentTableReferences
                                        ._reviewerIdTable(db),
                                referencedColumn:
                                    $$RequestReviewersEditorsAssigmentTableReferences
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

typedef $$RequestReviewersEditorsAssigmentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RequestReviewersEditorsAssigmentTable,
      RequestReviewersEditorsAssigmentData,
      $$RequestReviewersEditorsAssigmentTableFilterComposer,
      $$RequestReviewersEditorsAssigmentTableOrderingComposer,
      $$RequestReviewersEditorsAssigmentTableAnnotationComposer,
      $$RequestReviewersEditorsAssigmentTableCreateCompanionBuilder,
      $$RequestReviewersEditorsAssigmentTableUpdateCompanionBuilder,
      (
        RequestReviewersEditorsAssigmentData,
        $$RequestReviewersEditorsAssigmentTableReferences,
      ),
      RequestReviewersEditorsAssigmentData,
      PrefetchHooks Function({bool requestId, bool editorId, bool reviewerId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$OrganizationTableTableManager get organization =>
      $$OrganizationTableTableManager(_db, _db.organization);
  $$AuthorTableTableManager get author =>
      $$AuthorTableTableManager(_db, _db.author);
  $$EditorTableTableManager get editor =>
      $$EditorTableTableManager(_db, _db.editor);
  $$ReviewerTableTableManager get reviewer =>
      $$ReviewerTableTableManager(_db, _db.reviewer);
  $$AdminTableTableManager get admin =>
      $$AdminTableTableManager(_db, _db.admin);
  $$ConferenceTableTableManager get conference =>
      $$ConferenceTableTableManager(_db, _db.conference);
  $$SectionTableTableManager get section =>
      $$SectionTableTableManager(_db, _db.section);
  $$ChatTableTableManager get chat => $$ChatTableTableManager(_db, _db.chat);
  $$RequestTableTableManager get request =>
      $$RequestTableTableManager(_db, _db.request);
  $$MessageTableTableManager get message =>
      $$MessageTableTableManager(_db, _db.message);
  $$RequestReviewersEditorsAssigmentTableTableManager
  get requestReviewersEditorsAssigment =>
      $$RequestReviewersEditorsAssigmentTableTableManager(
        _db,
        _db.requestReviewersEditorsAssigment,
      );
}
