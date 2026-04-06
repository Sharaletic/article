part of 'athor_bloc.dart';

typedef AthorEventMatch<R, S extends AuthorEvent> = R Function(S event);

sealed class AuthorEvent {
  const AuthorEvent();

  const factory AuthorEvent.createAuthor({required AuthorEntity author}) =
      CreateAuthorEvent;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required AthorEventMatch<R, CreateAuthorEvent> createAuthor,
  }) {
    return switch (this) {
      CreateAuthorEvent s => createAuthor(s),
    };
  }
}

final class CreateAuthorEvent extends AuthorEvent {
  const CreateAuthorEvent({required this.author});
  final AuthorEntity author;
}
