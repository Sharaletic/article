import 'package:firebase_auth/firebase_auth.dart';

import '../../authentication.dart';

class UserDto {
  UserDto({
    required this.uid,
    required this.emailAddress,
    required this.displayName,
    required this.photoUrl,
  });

  final String uid;
  final String emailAddress;
  final String displayName;
  final String photoUrl;

  UserEntity toEntity() => UserEntity.authenticatedUser(
    uid: uid,
    emailAddress: emailAddress,
    displayName: displayName,
    photoUrl: photoUrl,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      uid: json['uid'] as String,
      emailAddress: json['email_address'] as String,
      displayName: json['display_name'] as String,
      photoUrl: json['photo_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email_address': emailAddress,
    'display_name': displayName,
    'photo_url': photoUrl,
  };

  factory UserDto.fromFirebase(User user) {
    return UserDto(
      uid: user.uid,
      emailAddress: user.email!,
      displayName: user.displayName!,
      photoUrl: user.photoURL!,
    );
  }
}
