import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../exception/api_server_exception.dart';
import 'api_server.dart';

class BaseApiServer implements ApiServer {
  static final _jsonUTF8 = json.fuse(utf8);

  List<int> encodeBody(Map<String, Object?> body) {
    try {
      return _jsonUTF8.encode(body);
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(
        BadRequestException(message: 'Error occured during encoding.'),
        stackTrace,
      );
    }
  }

  @override
  Response sendResponse(
    int statusCode, {
    Map<String, Object?>? body,
    Map<String, String>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) {
    Response response = Response(statusCode, encoding: utf8);

    if (body != null) {
      response = response.change(body: encodeBody(body));
      response = response.change(headers: {'Content-Type': 'application/json'});
    }
    if (headers != null) response = response.change(headers: headers);

    return response;
  }
}
