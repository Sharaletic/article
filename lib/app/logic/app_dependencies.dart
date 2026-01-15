import 'package:logger/logger.dart';

abstract interface class IAppDependencies {
  Logger get logger;
  Future<void> dispose();
}

final class AppDependencies implements IAppDependencies {
  AppDependencies._({required this.logger});

  @override
  final Logger logger;

  static Future<IAppDependencies> init({required Logger logger}) async {
    // Logger
    final initLogger = logger;

    return AppDependencies._(logger: initLogger);
  }

  @override
  Future<void> dispose() async {
    await [logger.close()].wait;
  }
}
