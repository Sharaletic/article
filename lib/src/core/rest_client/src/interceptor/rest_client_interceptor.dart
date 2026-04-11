class RestClientRequest {
  RestClientRequest({
    required this.uri,
    required this.method,
    this.queryParameters,
    this.body,
    this.headers = const {},
  });

  final Uri uri;
  final String method;
  final Map<String, String?>? queryParameters;
  final Map<String, Object?>? body;
  final Map<String, String> headers;

  RestClientRequest copyWith({
    Uri? uri,
    String? method,
    Map<String, Object?>? body,
    Map<String, String>? headers,
  }) => RestClientRequest(
    uri: uri ?? this.uri,
    method: method ?? this.method,
    body: body ?? this.body,
    headers: headers ?? this.headers,
  );

  @override
  String toString() => 'RestClientRequest(method: $method, uri: $uri)';
}

class RestClientResponse {
  RestClientResponse({
    required this.statusCode,
    required this.body,
    required this.request,
    required this.headers,
  });

  final int statusCode;
  final Map<String, Object?>? body;
  final RestClientRequest request;
  final Map<String, String> headers;

  RestClientResponse copyWith({
    int? statusCode,
    Map<String, Object?>? body,
    RestClientRequest? request,
    Map<String, String>? headers,
  }) => RestClientResponse(
    statusCode: statusCode ?? this.statusCode,
    body: body ?? this.body,
    request: request ?? this.request,
    headers: headers ?? this.headers,
  );
}

abstract interface class RestClientInterceptor {
  Future<RestClientRequest> onRequest(RestClientRequest request);
  Future<RestClientResponse> onResponse(RestClientResponse response);
  Future<RestClientResponse> onError(
    Object error,
    StackTrace stackTrace,
    RestClientRequest request,
  );
}

abstract class BaseInterceptor implements RestClientInterceptor {
  const BaseInterceptor();

  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async =>
      request;

  @override
  Future<RestClientResponse> onResponse(RestClientResponse response) async =>
      response;

  @override
  Future<RestClientResponse> onError(
    Object error,
    StackTrace stackTrace,
    RestClientRequest request,
  ) async {
    Error.throwWithStackTrace(error, stackTrace);
  }
}
