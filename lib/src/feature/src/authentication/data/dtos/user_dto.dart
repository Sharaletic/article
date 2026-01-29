import 'package:firebase_auth/firebase_auth.dart';

import '../../authentication.dart';

class UserDto {
  UserDto({
    required this.uid,
    required this.emailAddress,
    this.role,
    this.displayName,
    this.photoUrl,
  });
  final String uid;
  final String emailAddress;
  final UserRole? role;
  final String? displayName;
  final String? photoUrl;

  UserEntity toEntity({UserRole? role}) => UserEntity.authenticatedUser(
    uid: uid,
    emailAddress: emailAddress,
    role: role,
    displayName: displayName,
    photoUrl: photoUrl,
  );

  Map<String, Object?>? toJson() => {
    'uid': uid,
    'email_address': emailAddress,
    'role': role,
    'display_name': displayName,
    'photo_url': photoUrl,
  };

  factory UserDto.fromEntity(AuthenticatedUser user) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    role: user.role,
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );

  factory UserDto.fromFirebase(User user) {
    return UserDto(
      uid: user.uid,
      emailAddress: user.email!,
      displayName: user.displayName!,
      photoUrl: user.photoURL!,
    );
  }
}
