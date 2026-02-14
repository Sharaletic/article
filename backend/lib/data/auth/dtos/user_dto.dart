import 'package:backend/domain/user_entity.dart';
import 'package:drift/drift.dart';
import '../../../core/database/database.dart';

class UserDto {
  UserDto({
    required this.uid,
    required this.emailAddress,
    required this.role,
    this.displayName,
    this.photoUrl,
  });
  final String uid;
  final String emailAddress;
  final UserRole role;
  final String? displayName;
  final String? photoUrl;

  Map<String, Object?> toJson() => {
    'uid': uid,
    'emailAddress': emailAddress,
    'displayName': displayName,
    'photoUrl': photoUrl,
  };

  UsersCompanion toCompanion() => UsersCompanion(
    uid: Value(uid),
    emailAddress: Value(emailAddress),
    role: Value(role.value),
    displayName: Value(displayName),
    photoUrl: Value(photoUrl),
  );

  UserEntity toEntity() => UserEntity(
    uid: uid,
    emailAddress: emailAddress,
    role: role,
    displayName: displayName,
    photoUrl: photoUrl,
  );

  factory UserDto.fromEntity(UserEntity user) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    role: user.role,
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );

  factory UserDto.fromJson(Map<String, Object?> json) => UserDto(
    uid: json['uid'] as String,
    emailAddress: json['email_address'] as String,
    role: UserRole.fromJson(json['role'] as String),
    displayName: json['display_name'] as String?,
    photoUrl: json['photo_url'] as String?,
  );

  factory UserDto.fromDataBase(User user) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    role: UserRole.fromJson(user.role),
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );
}
