import 'package:drift/drift.dart';
import 'package:backend/domain/user.dart';
import '../../database/database.dart';

class UserDto {
  final String uid;
  final String emailAddress;
  final String? displayName;
  final String? photoUrl;
  UserDto({
    required this.uid,
    required this.emailAddress,
    this.displayName,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'emailAddress': emailAddress,
    'displayName': displayName,
    'photoUrl': photoUrl,
  };

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    uid: json['uid'] as String,
    emailAddress: json['emailAddress'] as String,
    displayName: json['displayName'] as String?,
    photoUrl: json['photoUrl'] as String?,
  );

  UsersCompanion toCompanion() => UsersCompanion(
    uid: Value(uid),
    emailAddress: Value(emailAddress),
    displayName: Value(displayName),
    photoUrl: Value(photoUrl),
  );

  factory UserDto.fromDataBase(User user) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );

  UserEntity toDomain() => UserEntity(
    uid: uid,
    emailAddress: emailAddress,
    displayName: displayName,
    photoUrl: photoUrl,
  );
}
