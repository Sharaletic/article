import 'package:drift/drift.dart';
import '../../../core/database/database.dart';
import '../../../core/rest_client/api_server.dart';
import '../../../domain/user_entity.dart';

UserRole _userRoleFromJson(String role) {
  final normalized = role.toLowerCase().trim();
  return switch (normalized) {
    'author' => UserRole.author,
    'reviewer' => UserRole.reviewer,
    'editor' => UserRole.editor,
    'admin' => UserRole.admin,
    _ => throw ValidationException(message: 'Unknown role: $role'),
  };
}

class UserDto {
  UserDto({
    required this.uid,
    required this.emailAddress,
    required this.role,
    required this.displayName,
    this.photoUrl,
  });
  final String uid;
  final String emailAddress;
  final UserRole role;
  final String displayName;
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

  factory UserDto.fromJson(Map<String, Object?> json) {
    if (json case <String, Object?>{
      'uid': var uid as String,
      'email_address': var emailAddress as String,
      'role': var role as String,
      'display_name': var displayName as String,
      'photo_url': var photoUrl as String?,
    }) {
      return UserDto(
        uid: uid,
        emailAddress: emailAddress,
        role: _userRoleFromJson(role),
        displayName: displayName,
        photoUrl: photoUrl,
      );
    } else {
      throw JsonDeserializationException(message: 'Invalid JSON format');
    }
  }

  factory UserDto.fromDataBase(User user) => UserDto(
    uid: user.uid,
    emailAddress: user.emailAddress,
    role: _userRoleFromJson(user.role),
    displayName: user.displayName,
    photoUrl: user.photoUrl,
  );
}
