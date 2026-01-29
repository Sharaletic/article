import '../../../authentication/authentication.dart';

abstract interface class IAuthorRepository {
  Future<void> createAuthor({required AuthenticatedUser user});
}
