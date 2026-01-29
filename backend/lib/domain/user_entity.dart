class UserEntity {
  UserEntity({
    required this.uid,
    required this.emailAddress,
    this.displayName,
    this.photoUrl,
  });
  final String uid;
  final String emailAddress;
  final String? displayName;
  final String? photoUrl;

  UserEntity copyWith({
    String? uid,
    String? emailAddress,
    String? displayName,
    String? photoUrl,
  }) => UserEntity(
    uid: uid ?? this.uid,
    emailAddress: emailAddress ?? this.emailAddress,
    displayName: displayName ?? this.displayName,
    photoUrl: photoUrl ?? this.photoUrl,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          uid == other.uid &&
          emailAddress == other.emailAddress &&
          displayName == other.displayName &&
          photoUrl == other.photoUrl;

  @override
  int get hashCode => uid.hashCode;
}
