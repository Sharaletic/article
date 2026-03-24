sealed class ApiServerException implements Exception {
  const ApiServerException({
    required this.message,
    required this.statusCode,
    this.cause,
  });
  final String message;
  final int statusCode;
  final Object? cause;

  Map<String, Object> bodyToJson() => {
    'error': {'message': message, 'cause': cause},
  };
}

final class NotFoundException extends ApiServerException {
  const NotFoundException({
    required super.message,
    super.statusCode = 404,
    super.cause,
  });

  @override
  String toString() =>
      'NotFoundException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause)';
}

class JsonDeserializationException extends ApiServerException {
  JsonDeserializationException({
    required super.message,
    super.statusCode = 500,
    super.cause,
  });

  @override
  String toString() =>
      'JsonDeserializationException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause)';
}

class ValidationException extends ApiServerException {
  ValidationException({
    required super.message,
    super.statusCode = 500,
    super.cause,
  });

  @override
  String toString() =>
      'ValidationException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause)';
}

final class BadRequestException extends ApiServerException {
  const BadRequestException({
    required super.message,
    super.statusCode = 400,
    super.cause,
  });

  @override
  String toString() =>
      'NotFoundException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause)';
}
