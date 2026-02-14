import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import '../rest_client.dart';

abstract base class BaseRestClient implements RestClient {
  BaseRestClient({required String baseUri}) : _baseUri = Uri.parse(baseUri);
  final Uri _baseUri;

  Future<Map<String, Object?>?> sendRequest({
    required String path,
    required String method,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
    Map<String, Object?>? body,
  });

  @override
  Future<Map<String, Object?>?> get({
    required String path,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  }) {
    return sendRequest(
      path: path,
      method: 'GET',
      queryParams: queryParams,
      headers: headers,
    );
  }

  @override
  Future<Map<String, Object?>?> post({
    required String path,
    required Map<String, Object?>? body,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  }) {
    return sendRequest(
      path: path,
      method: 'POST',
      queryParams: queryParams,
      headers: headers,
      body: body,
    );
  }

  @override
  Future<Map<String, Object?>?> put({
    required String path,
    required Map<String, Object?>? body,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  }) {
    return sendRequest(
      path: path,
      method: 'PUT',
      queryParams: queryParams,
      headers: headers,
      body: body,
    );
  }

  @override
  Future<Map<String, Object?>?> delete({
    required String path,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
  }) {
    return sendRequest(
      path: path,
      method: 'DELETE',
      queryParams: queryParams,
      headers: headers,
    );
  }

  Uri createUri({required String path, Map<String, String?>? queryParams}) {
    final uri = Uri.parse(p.join(_baseUri.path, path));
    return _baseUri.replace(
      path: uri.path,
      queryParameters: {..._baseUri.queryParameters, ...?queryParams},
    );
  }

  Map<String, Object?>? decodeResponse({
    ResponseBody<Object>? body,
    int? statusCode,
  }) {
    if (body == null) return null;
    try {
      final decodedBody = switch (body) {
        MapResponseBody(data: final Map<String, Object?> mapData) => mapData,
        StringResponseBody(data: final String stringData) => {
          'data': stringData,
        },
      };

      if (decodedBody case {'error': final Map<String, Object?> error}) {
        throw StructuredBackendException(error: error, statusCode: statusCode);
      }
      if (decodedBody case {'data': final Map<String, Object?> data}) {
        return data;
      }
      return decodedBody;
    } on RestClientException {
      rethrow;
    } on http.ClientException catch (e, stackTrace) {
      final checkedException = checkHttpException(e);

      if (checkedException != null) {
        Error.throwWithStackTrace(checkedException, stackTrace);
      } else {
        Error.throwWithStackTrace(
          ClientException(message: e.message, cause: e),
          stackTrace,
        );
      }
    }
  }
}

sealed class ResponseBody<T> {
  const ResponseBody(this.data);
  final T data;
}

class MapResponseBody extends ResponseBody<Map<String, Object?>> {
  const MapResponseBody(super.data);
}

class StringResponseBody extends ResponseBody<String> {
  const StringResponseBody(super.data);
}
