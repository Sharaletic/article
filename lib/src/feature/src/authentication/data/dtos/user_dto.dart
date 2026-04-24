import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/core.dart';
import '../../authentication.dart';

UserRole _roleFromStringToUserRole(String role) => switch (role) {
  'author' => UserRole.author,
  'reviewer' => UserRole.reviewer,
  'editor' => UserRole.editor,
  'admin' => UserRole.admin,
  _ => throw StructuredBackendException(
    error: {'details': 'Invalid role $role received.'},
  ),
};

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
    'role': role?.value,
    'display_name': displayName,
    'photo_url': photoUrl,
  };

  factory UserDto.fromEntity({required UserEntity entity}) {
    final authenticatedUser = entity as AuthenticatedUser;
    return UserDto(
      uid: authenticatedUser.uid,
      emailAddress: authenticatedUser.emailAddress,
      role: authenticatedUser.role,
      displayName: authenticatedUser.displayName,
      photoUrl: authenticatedUser.photoUrl,
    );
  }

  factory UserDto.fromJson({required Map<String, Object?> json}) => UserDto(
    uid: json['uid'] as String,
    emailAddress: json['email_address'] as String,
    role: _roleFromStringToUserRole(json['role'] as String),
    displayName: json['display_name'] as String?,
    photoUrl: json['photo_url'] as String?,
  );

  factory UserDto.fromFirebase({required User user, UserRole? role}) {
    return UserDto(
      uid: user.uid,
      emailAddress: user.email!,
      role: role,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
