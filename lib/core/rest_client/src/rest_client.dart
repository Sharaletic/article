abstract interface class RestClient {
  Future<Map<String, Object?>?> get({
    required String path,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  });

  Future<Map<String, Object?>?> post({
    required String path,
    required Map<String, Object?>? body,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  });

  Future<Map<String, Object?>?> put({
    required String path,
    required Map<String, Object?>? body,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  });

  Future<Map<String, Object?>?> delete({
    required String path,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  });
}
