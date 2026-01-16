import 'dart:async';

import 'package:arcticle_app/app/widget/failed_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/core.dart';

void main() {
  final logger = LoggerSettings.initLogger();

  runZonedGuarded(
    () async {
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
    return DependenciesScope(dependencies: dependencies, child: Scaffold());
  }
}
