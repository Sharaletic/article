part of 'athor_bloc.dart';

typedef AthorEventMatch<R, S extends AthorEvent> = R Function(S event);

sealed class AthorEvent {
  const AthorEvent();

  const factory AthorEvent.createAuthor({required AuthorEntity author}) =
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

final class CreateAuthorEvent extends AthorEvent {
  const CreateAuthorEvent({required this.author});
  final AuthorEntity author;
}
