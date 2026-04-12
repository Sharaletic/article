import 'package:firebase_admin/firebase_admin.dart';

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
      'BadRequestException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause)';
}

final class InternalServerException extends ApiServerException {
  const InternalServerException({
    required super.message,
    super.statusCode = 500,
    super.cause,
  });

  @override
  String toString() =>
      'InternalServerException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause)';
}

ApiServerException firebaseAuthErrorToApiServerException(
  FirebaseAuthError error,
) {
  return switch (error.code) {
    'auth/user-not-found' => NotFoundException(
      message: 'User not found',
      cause: error,
    ),
    'auth/claims-too-large' => BadRequestException(
      message: 'Claims too large',
      cause: error,
    ),
    'auth/invalid-claims' => BadRequestException(
      message: 'Invalid claims',
      cause: error,
    ),
    'auth/invalid-uid' => BadRequestException(
      message: 'Invalid UID',
      cause: error,
    ),
    'auth/reserved-claims' => BadRequestException(
      message: 'Cannot use reserved claim names (sub, iat, iss, etc.)',
      cause: error,
    ),
    'auth/internal-error' => InternalServerException(
      message: 'Internal error while setting custom claims',
      cause: error,
    ),
    _ => InternalServerException(
      message:
          'Unexpected error with code ${error.code} while setting custom claims',
      cause: error,
    ),
  };
}
