import 'dart:async';
import 'package:arcticle_app/src/feature/src/athor/author.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app/app.dart';
import 'src/core/core.dart';
import 'src/feature/src/authentication/authentication.dart';

Future<void> main() async {
  final logger = LoggerSettings.initLogger();
  final router = AppRouter();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      try {
        final dependencies = await AppDependencies.init(
          logger: logger,
          router: router,
        );
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
    return DependenciesScope(
      dependencies: dependencies,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              authenticationRepository: dependencies.authenticationRepository,
            ),
          ),
          BlocProvider<AuthorBloc>(
            create: (context) =>
                AuthorBloc(authorRepository: dependencies.authorRepository),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: dependencies.router.config(),
            );
          },
        ),
      ),
    );
  }
}
