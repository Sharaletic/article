import 'package:drift/drift.dart';
import '../../../../core/database/database.dart';
import '../../conference.dart';

abstract interface class IConferenceRepository {
  Future<List<ConferenceEntity>> searchConferences({required String query});
}

class ConferenceRepositoryImpl implements IConferenceRepository {
  ConferenceRepositoryImpl({required AppDatabase appDatabase})
    : _appDatabase = appDatabase;
  final AppDatabase _appDatabase;

  @override
  Future<List<ConferenceEntity>> searchConferences({
    required String query,
  }) async {
    final pattern = '%$query%';
    final data =
        await (_appDatabase.select(_appDatabase.conference)..where((row) {
              return row.title.like(pattern);
            }))
            .get();

    final result = data
        .map((row) => ConferenceDto.fromDataBase(row).toEntity())
        .toList();

    return result;
  }
}
