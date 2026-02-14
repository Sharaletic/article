import '../../author.dart';

abstract interface class IAuthorRepository {
  Future<void> createAuthor({required AuthorEntity author});
}
