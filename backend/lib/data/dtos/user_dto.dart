import 'package:backend/domain/user_entity.dart';
import 'package:drift/drift.dart';
import '../../database/database.dart';

class UserDto {
  UserDto({
    required this.uid,
    required this.emailAddress,
    this.displayName,
    this.photoUrl,
  });
  final String uid;
  final String emailAddress;
  final String? displayName;
  final String? photoUrl;

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'emailAddress': emailAddress,
    'displayName': displayName,
    'photoUrl': photoUrl,
  };

  UsersCompanion toCompanion() => UsersCompanion(
    uid: Value(uid),
    emailAddress: Value(emailAddress),
    displayName: Value(displayName),
    photoUrl: Value(photoUrl),
  );

  UserEntity toEntity() => UserEntity(
    uid: uid,
    emailAddress: emailAddress,
    displayName: displayName,
    photoUrl: photoUrl,
  );

  factory UserDto.fromEntity(UserEntity user) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );

  factory UserDto.fromJson(Map<String, Object> json) => UserDto(
    uid: json['uid'] as String,
    emailAddress: json['emailAddress'] as String,
    displayName: json['displayName'] as String?,
    photoUrl: json['photoUrl'] as String?,
  );

  factory UserDto.fromDataBase(User user) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );
}
