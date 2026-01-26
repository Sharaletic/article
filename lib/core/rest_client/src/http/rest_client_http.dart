import 'dart:convert';
import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../../rest_client.dart';

http.Client httpClient() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return CronetClient.defaultCronetEngine();
  }
  if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    return CupertinoClient.defaultSessionConfiguration();
  }
  return IOClient();
}

final class RestClientHttp extends BaseRestClient {
  RestClientHttp({required this.httpClient, required super.baseUri});
  final http.Client httpClient;

  @override
  Future<Map<String, Object?>?> sendRequest({
    required String path,
    required String method,
    Map<String, String?>? queryParams,
    Map<String, String>? headers,
    Map<String, Object?>? body,
  }) async {
    try {
      final uri = createUri(path: path, queryParams: queryParams);

      final request = http.Request(method, uri);

      if (body != null) {
        request.headers['Content-Type'] = 'application/json';
        request.body = jsonEncode(body);
      }

      if (headers != null) {
        request.headers.addAll(headers);
      }

      final response = await httpClient
          .send(request)
          .then(http.Response.fromStream);

      final result = decodeResponse(body: StringResponseBody(response.body));

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
