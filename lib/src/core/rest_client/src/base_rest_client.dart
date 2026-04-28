import 'dart:convert';
import 'package:arcticle_app/src/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

abstract base class BaseRestClient implements RestClient {
  BaseRestClient({
    required String baseUri,
    List<RestClientInterceptor>? interceptors,
  }) : _baseUri = Uri.parse(baseUri),
       _interceptors = interceptors ?? const [];
  final Uri _baseUri;
  final List<RestClientInterceptor> _interceptors;

  static final _jsonUTF8 = json.fuse(utf8);

  @protected
  List<int> encodeBody(Map<String, Object?> body) => _jsonUTF8.encode(body);

  @protected
  Future<RestClientResponse> sendRequest(RestClientRequest request);

  Future<Map<String, Object?>?> send({
    required String path,
    required String method,
    Map<String, String?>? queryParameters,
    Map<String, String>? headers,
    Map<String, Object?>? body,
  }) async {
    var request = RestClientRequest(
      uri: createUri(path: path, queryParameters: queryParameters),
      method: method,
      body: body,
      headers: headers ?? {},
    );

    for (final interceptor in _interceptors) {
      request = await interceptor.onRequest(request);
    }
    try {
      var response = await sendRequest(request);

      for (final interceptor in _interceptors.reversed) {
        response = await interceptor.onResponse(response);
      }

      return response.body;
    } catch (error, stackTrace) {
      for (final interceptor in _interceptors.reversed) {
        try {
          var response = await interceptor.onError(error, stackTrace, request);
          return response.body;
        } catch (newError, newStackTrace) {
          if (identical(newError, error)) continue;
          Error.throwWithStackTrace(newError, newStackTrace);
        }
      }
      rethrow;
    }
  }

  @override
  Future<Map<String, Object?>?> get({
    required String path,
    Map<String, String?>? queryParameters,
    Map<String, String>? headers,
  }) {
    return send(
      path: path,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  @override
  Future<Map<String, Object?>?> post({
    required String path,
    required Map<String, Object?>? body,
    Map<String, String?>? queryParameters,
    Map<String, String>? headers,
  }) {
    return send(
      path: path,
      method: 'POST',
      queryParameters: queryParameters,
      headers: headers,
      body: body,
    );
  }

  @override
  Future<Map<String, Object?>?> put({
    required String path,
    required Map<String, Object?>? body,
    Map<String, String?>? queryParameters,
    Map<String, String>? headers,
  }) {
    return send(
      path: path,
      method: 'PUT',
      queryParameters: queryParameters,
      headers: headers,
      body: body,
    );
  }

  @override
  Future<Map<String, Object?>?> delete({
    required String path,
    Map<String, String?>? queryParameters,
    Map<String, String>? headers,
  }) {
    return send(
      path: path,
      method: 'DELETE',
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  Uri createUri({required String path, Map<String, String?>? queryParameters}) {
    final uri = Uri.parse(p.join(_baseUri.path, path));
    return _baseUri.replace(
      path: uri.path,
      queryParameters: {..._baseUri.queryParameters, ...?queryParameters},
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
        StringResponseBody(data: final String stringData) =>
          json.decode(stringData) as Map<String, Object?>,
        BytesResponseBody(:final List<int> data) => _decodeBytes(data),
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

  Map<String, Object?>? _decodeBytes(List<int> bytesBody) {
    if (bytesBody.isEmpty) return null;

    return _jsonUTF8.decode(bytesBody)! as Map<String, Object?>;
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

class BytesResponseBody extends ResponseBody<List<int>> {
  const BytesResponseBody(super.data);
}
