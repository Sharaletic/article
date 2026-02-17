import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app/app.dart';
import 'src/core/core.dart';
import 'src/feature/src/athor/author.dart';

Future<void> main() async {
  final logger = LoggerSettings.initLogger();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      try {
        final dependencies = await AppDependencies.init(logger: logger);
        Bloc.observer = AppBlocObserver(logger: logger);
        runApp(MyApp(dependencies: dependencies));
      } on Object catch (error, stackTrace) {
        logger.severe('Initialization failed', error, stackTrace);
        runApp(FailedApp());
      }
    },
    (error, stackTrace) {
      logger.severe(error, error, stackTrace);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.dependencies, super.key});
  final IAppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DependenciesScope(
        dependencies: dependencies,
        child: const AddInformation(),
      ),
    );
  }
}
