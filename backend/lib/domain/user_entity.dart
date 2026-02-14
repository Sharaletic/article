enum UserRole {
  author('author'),
  reviewer('reviewer'),
  editor('editor'),
  admin('admin');

  const UserRole(this.value);
  final String value;

  factory UserRole.fromJson(String role) => switch (role) {
    'author' => UserRole.author,
    'reviewer' => UserRole.reviewer,
    'editor' => UserRole.editor,
    'admin' => UserRole.admin,
    _ => throw Exception('Unknown role: $role'),
  };
}

class UserEntity {
  UserEntity({
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          uid == other.uid &&
          emailAddress == other.emailAddress &&
          role == other.role &&
          displayName == other.displayName &&
          photoUrl == other.photoUrl;

  @override
  int get hashCode => uid.hashCode;
}
