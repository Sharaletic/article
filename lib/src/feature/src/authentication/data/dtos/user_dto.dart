import 'package:firebase_auth/firebase_auth.dart';

import '../../authentication.dart';

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

  UserEntity toEntity() => UserEntity.authenticatedUser(
    uid: uid,
    emailAddress: emailAddress,
    role: role,
    displayName: displayName,
    photoUrl: photoUrl,
  );

  Map<String, Object?> toJson() => {
    'uid': uid,
    'email_address': emailAddress,
    'role': role.value,
    'display_name': displayName,
    'photo_url': photoUrl,
  };

  factory UserDto.fromEntity({required AuthenticatedUser user}) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    role: user.role,
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );

  factory UserDto.fromJson({required Map<String, Object?> json}) => UserDto(
    uid: json['uid'] as String,
    emailAddress: json['email_address'] as String,
    role: UserRole.values[json['role'] as int],
    displayName: json['display_name'] as String?,
    photoUrl: json['photo_url'] as String?,
  );

  factory UserDto.fromFirebase({required User user, required UserRole role}) {
    return UserDto(
      uid: user.uid,
      emailAddress: user.email!,
      role: role,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
