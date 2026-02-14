import '../../../../../app/app.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

class AuthorEntity with EqualsMixin {
  const AuthorEntity({
    required this.id,
    required this.user,
    required this.lastName,
    required this.firstName,
    this.middleName,
    required this.organization,
    this.educationLevel,
    this.post,
    this.academicDegree,
    this.academictitle,
  });
  final int id;
  final AuthenticatedUser user;
  final String lastName;
  final String firstName;
  final String? middleName;
  final OrganizationEntity organization;
  final String? educationLevel;
  final String? post;
  final String? academicDegree;
  final String? academictitle;

  @override
  String toString() => '_AuthorEntityCreated(user: ${user.toString()})';

  @override
  List<Object?> get fields => [
    id,
    user,
    lastName,
    firstName,
    middleName,
    organization,
    educationLevel,
    post,
    academicDegree,
    academictitle,
  ];
}
