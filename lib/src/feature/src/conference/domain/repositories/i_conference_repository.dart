import '../../conference.dart';

abstract interface class IConferenceRepository {
  Future<List<ConferenceEntity>?> searchConferences({required String query});
}
