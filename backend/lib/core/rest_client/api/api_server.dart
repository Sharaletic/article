import 'dart:convert';
import 'package:shelf/shelf.dart';

abstract interface class ApiServer {
  Response sendResponse(
    int statusCode, {
    Map<String, Object?> body,
    Map<String, String>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  });
}
