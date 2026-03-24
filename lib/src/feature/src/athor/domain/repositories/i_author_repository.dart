import '../../author.dart';

abstract interface class IAuthorRepository {
  Future<void> createAthor({required AuthorEntity author});
}
