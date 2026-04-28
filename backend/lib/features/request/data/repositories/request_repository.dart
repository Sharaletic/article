import '../../../../core/database/database.dart';
import '../../request.dart';

abstract interface class IRequestRepository {
  Future<void> createRequest({required RequestEntity request});
}

class RequestRepositoryImpl implements IRequestRepository {
  RequestRepositoryImpl({required AppDatabase appDatabase})
    : _appDatabase = appDatabase;
  final AppDatabase _appDatabase;

  @override
  Future<void> createRequest({required RequestEntity request}) async {
    await _appDatabase
        .into(_appDatabase.request)
        .insert(RequestDto.fromEntity(request).toCompanion());
  }
}
