import '../../../app/app.dart';

enum UserRole {
  author('author'),
  reviewer('reviewer'),
  editor('editor'),
  admin('admin');

  const UserRole(this.value);
  final String value;
}

class UserEntity with EqualsMixin {
  UserEntity({
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

  UserEntity copyWith({
    String? uid,
    String? emailAddress,
    UserRole? role,
    String? displayName,
    String? photoUrl,
  }) => UserEntity(
    uid: uid ?? this.uid,
    emailAddress: emailAddress ?? this.emailAddress,
    role: role ?? this.role,
    displayName: displayName ?? this.displayName,
    photoUrl: photoUrl ?? this.photoUrl,
  );

  @override
  List<Object?> get fields => [uid, emailAddress, role, displayName, photoUrl];
}
