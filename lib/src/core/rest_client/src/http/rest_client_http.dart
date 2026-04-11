import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../rest_client.dart';

http.Client createDefaultHttpClient() {
  return http.Client();
}

final class RestClientHttp extends BaseRestClient {
  RestClientHttp({
    http.Client? httpClient,
    required super.baseUri,
    required super.logger,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<Map<String, Object?>?> sendRequest({
    required String path,
    required String method,
    Map<String, String?>? queryParameters,
    Map<String, String>? headers,
    Map<String, Object?>? body,
  }) async {
    try {
      final uri = createUri(path: path, queryParameters: queryParameters);

      final request = http.Request(method, uri);

      if (body != null) {
        request.headers['Content-Type'] = 'application/json';
        request.body = jsonEncode(body);
      }

      if (headers != null) request.headers.addAll(headers);

      final response = await _httpClient
          .send(request)
          .then(http.Response.fromStream);

      final result = decodeResponse(
        body: BytesResponseBody(response.bodyBytes),
        statusCode: response.statusCode,
      );
      return result;
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
