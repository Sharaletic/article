sealed class RestClientException implements Exception {
  const RestClientException({
    required this.message,
    this.statusCode,
    this.cause,
  });
  final String message;
  final int? statusCode;
  final Object? cause;
}

final class ClientException extends RestClientException {
  const ClientException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'ClientException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      ')';
}

final class AuthenticationTokenException extends RestClientException {
  const AuthenticationTokenException({super.cause})
    : super(message: 'Токен недействителен или срок его действия истек');

  @override
  String toString() => 'AuthenticationTokenException: $message';
}

final class StructuredBackendException extends RestClientException {
  StructuredBackendException({required this.error, super.statusCode = 500})
    : super(message: 'Backend returned structured error');
  final Map<String, Object?> error;

  @override
  String toString() =>
      'StructuredBackendException('
      'message: $message, '
      'error: $error, '
      'statusCode: $statusCode, '
      ')';
}

final class WrongResponseTypeException extends RestClientException {
  const WrongResponseTypeException({required super.message, super.statusCode});

  @override
  String toString() =>
      'WrongResponseTypeException('
      'message: $message, '
      'statusCode: $statusCode, '
      ')';
}

final class ConnectionException extends RestClientException {
  const ConnectionException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'ConnectionException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      ')';
}

final class InternalServerException extends RestClientException {
  const InternalServerException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'InternalServerException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      ')';
}
