import 'package:firebase_admin/firebase_admin.dart';
import 'package:logger/logger.dart';
import '../logging/logger.dart';
import '../model/application_config.dart';
import '../model/dependencies_container.dart';
import '../../database/database.dart';
import '../../router/router.dart';
import '../../data/data.dart';

final class CompositionResult {
  const CompositionResult({required this.dependencies});

  final DependenciesContainer dependencies;

  @override
  String toString() =>
      'CompositionResult('
      'dependencies: $dependencies, '
      ')';
}

Future<CompositionResult> composeDependencies({required Logger logger}) async {
  logger.info('Initializing dependencies...');

  final dependencies = await createDependenciesContainer(logger: logger);

  return CompositionResult(dependencies: dependencies);
}

Future<DependenciesContainer> createDependenciesContainer({
  required Logger logger,
}) async {
  // ApplicationConfig
  final config = ApplicationConfig();

  // Database
  final appDatabase = AppDatabase();

  // Firebase
  final firebaseAdminSDKApp = FirebaseAdmin.instance.initializeApp(
    AppOptions(
      credential: FirebaseAdmin.instance.certFromPath(
        config.pathToServiceAccount,
      ),
      projectId: 'article',
    ),
  );

  // User
  final userRepository = UserRepositoryImpl(appDatabase: appDatabase);
  final userController = UserController(userRepository: userRepository);

  return DependenciesContainer(
    logger: logger,
    firebaseAdminSDKApp: firebaseAdminSDKApp,
    config: config,
    userController: userController,
  );
}
