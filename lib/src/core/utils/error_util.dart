import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';
import '../rest_client/rest_client.dart';

abstract final class ErrorUtil {
  static String errorToString(Object error) => switch (error) {
    String value => value,
    RestClientException value => _httpExceptionTostring(value),
    FirebaseException value => _firebaseExceptionToString(value),
    Object() => error.toString(),
  };

  static void displayErrorSnackBar(
    BuildContext context,
    Object error, [
    StackTrace? stackTrace,
  ]) {
    try {
      if (!context.mounted) return;
      final messenger = ScaffoldMessenger.maybeOf(context);
      if (messenger == null) return;
      final action = () {
        final navigation = Navigator.maybeOf(context);
        if (navigation == null) return null;
        return SnackBarAction(
          label: 'Детали',
          onPressed: () {
            if (!navigation.mounted) return;
            showAdaptiveDialog<void>(
              context: navigation.context,
              barrierDismissible: true,
              useSafeArea: true,
              builder: (context) => AlertDialog(
                title: UiText.bodyMedium('Детали ошибки'),
                contentPadding: const .all(16),
                content: SizedBox(
                  width: 420,
                  child: Stack(
                    alignment: .topLeft,
                    fit: StackFit.loose,
                    clipBehavior: Clip.none,
                    children: [
                      SingleChildScrollView(
                        padding: const .fromLTRB(16, 16, 16, 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(errorToString(error)),
                            const Divider(),
                            Text(error.toString()),
                            if (stackTrace != null) ...[
                              const Divider(),
                              Text('$stackTrace'),
                            ],
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              final message = StringBuffer()
                                ..writeln(errorToString(error))
                                ..writeln('------')
                                ..writeln(error);
                              if (stackTrace != null) {
                                message
                                  ..writeln('------')
                                  ..writeln(stackTrace);
                              }
                              Clipboard.setData(
                                ClipboardData(text: message.toString()),
                              ).ignore();
                              HapticFeedback.mediumImpact().ignore();
                            },
                            tooltip: 'Copy to clipboard',
                            icon: const Icon(Icons.copy_all),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  UiButton.filledPrimary(
                    onPressed: () => navigation.popUntil(
                      (route) =>
                          !(route is PopupRoute ||
                              route is RawDialogRoute ||
                              route is ModalBottomSheetRoute),
                    ),

                    label: const Text('Закрыть'),
                  ),
                ],
              ),
            ).ignore();
          },
        );
      }();
      final snackBar = SnackBar(
        content: Text(errorToString(error)),
        duration: const Duration(seconds: 5),
        action: action,
      );
      ScaffoldMessenger.maybeOf(context)
        ?..clearSnackBars()
        ..showSnackBar(snackBar);
    } on Object {
      /* ignore */
    }
  }
}

String _httpExceptionTostring(
  RestClientException error,
) => switch (error.statusCode) {
  509 => 'The request exceeded the bandwidth limit.',
  504 =>
    'The server did not receive a timely responce from the upstream server.',
  503 => 'The server is currently unavailable, please try again later.',
  502 => 'Bad gateway, please try again later.',
  500 => 'An internal server error occuredd, please try again later.',
  int code when code.toString().startsWith('5') =>
    'A server error occuredd, please try again later.',
  429 => 'Too many requests, please try again later.',
  422 => 'The request data is invalid or malformed.',
  409 =>
    'The request could not be completed due to a conflict with current state of the resource.',
  408 => 'The request timed out, please try again later.',
  404 => 'The requested resource was not found.',
  403 => 'You do not have permission to access this resource.',
  401 => 'You are not authorized to access this resource.',
  400 => 'The request was invalid or malformed.',
  int code when code.toString().startsWith('4') =>
    'A client error occuredd, please check your request.',
  int code when code.toString().startsWith('3') =>
    'The request was redirected, please check the URL.',
  _ => 'An error occuredd while proccesing the request.',
};

String _firebaseExceptionToString(FirebaseException error) =>
    switch (error.code.split('/').last.trim().toLowerCase()) {
      'email-already-in-use' => 'Такой email уже зарегистрирован.',
      'invalid-email' => 'Веденный email неверен.',
      'wrong-password' => 'Введенный пароль неверен.',
      'weak-password' => 'Ваш пароль недостаточно надежный.',
      'user-disabled' => 'Ваш аккаунт заблокирован.',
      'user-not-found' => 'Такого пользователя не существует.',
      'invalid-credential' => 'Неверная учетная запись.',
      'invalid-user-token' => 'Неверный токен пользователя.',
      'user-token-expired' => 'Токен пользователя истек.',
      'null-user' => 'Пользователь не авторизован.',
      'too-many-requests' =>
        'Количество запросов превышает максимально допустимое.',
      'account-exists-with-different-credential' =>
        'Уже существует учетная запись с указанным адресом электронной почты.',
      _ => error.message.toString(),
    };
