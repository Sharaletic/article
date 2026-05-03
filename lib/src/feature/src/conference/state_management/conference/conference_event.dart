part of 'conference_bloc.dart';

typedef ConferenceEventMatch<R, S extends ConferenceEvent> =
    R Function(S event);

sealed class ConferenceEvent {
  const ConferenceEvent();

  const factory ConferenceEvent.search({required String query}) =
      _SearchConferenceEvent;

  R map<R>({
    // ignore: library_private_types_in_public_api
    required ConferenceEventMatch<R, _SearchConferenceEvent> search,
  }) => switch (this) {
    _SearchConferenceEvent s => search(s),
  };
}

final class _SearchConferenceEvent extends ConferenceEvent {
  const _SearchConferenceEvent({required this.query});
  final String query;
}
