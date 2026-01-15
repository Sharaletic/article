import 'package:logger/logger.dart';

class LoggerSettings {
  static Logger initLogger() {
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );
    return logger;
  }
}

extension LoggerExtension on Logger {
  void debug(dynamic message) => log(Level.debug, message);

  void info(dynamic message) => log(Level.info, message);

  void severe(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      log(Level.error, message, error: error, stackTrace: stackTrace);
}
