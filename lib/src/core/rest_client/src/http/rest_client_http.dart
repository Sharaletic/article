import 'package:http/http.dart' as http;
import '../../rest_client.dart';

http.Client createDefaultHttpClient() {
  return http.Client();
}

final class RestClientHttp extends BaseRestClient {
  RestClientHttp({
    http.Client? httpClient,
    required super.baseUri,
    super.interceptors,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<RestClientResponse> sendRequest(RestClientRequest request) async {
    try {
      final httpRequest = http.Request(request.method, request.uri);
      httpRequest.headers.addAll(request.headers);

      if (request.body != null) {
        httpRequest.bodyBytes = encodeBody(request.body!);
        httpRequest.headers['content-type'] = 'application/json;charset=utf-8';
      }

      final response = await _httpClient
          .send(httpRequest)
          .then(http.Response.fromStream);

      final body = decodeResponse(
        body: BytesResponseBody(response.bodyBytes),
        statusCode: response.statusCode,
      );

      return RestClientResponse(
        statusCode: response.statusCode,
        body: body,
        request: request,
        headers: response.headers,
      );
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
