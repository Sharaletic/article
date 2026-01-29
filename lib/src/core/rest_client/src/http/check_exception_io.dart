import 'dart:io';
import 'package:http/http.dart' as http;
import '../../rest_client.dart';

Object? checkHttpException(http.ClientException e) => switch (e) {
  final SocketException socketException => ConnectionException(
    message: socketException.message,
    cause: e,
  ),
  _ => null,
};
