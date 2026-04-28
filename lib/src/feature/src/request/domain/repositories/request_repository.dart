import '../../request.dart';

abstract interface class IRequestRepository {
  Future<void> createRequest({required RequestEntity request});
}
