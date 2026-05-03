import 'package:firebase_admin/firebase_admin.dart';
import 'package:logger/logger.dart';
import '../../auth/claims_service.dart';
import '../../core/rest_client/api_server.dart';
import '../../features/auth/auth.dart';
import '../../features/author/author.dart';
import '../../features/request/request.dart';
import '../../features/conference/conference.dart';
import '../logging/logger.dart';
import '../model/application_config.dart';
import '../model/dependencies_container.dart';
import '../../core/database/database.dart';

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

  // appDatabase
  //     .into(appDatabase.conference)
  //     .insert(
  //       ConferenceCompanion(
  //         title: const Value('Конференция 1'),
  //         shortDescription: const Value('Краткое описание конференции 1'),
  //         startConferenceDate: Value(DateTime(2023, 10, 1)),
  //         endConferenceDate: Value(DateTime(2023, 10, 5)),
  //         address: const Value('Адрес конференции 1'),
  //         conferenceFormat: const Value([ConferenceFormat.online]),
  //         submissionStartDate: Value(DateTime(2023, 8, 1)),
  //         submissionEndDate: Value(DateTime(2023, 8, 31)),
  //         quantityOfPages: const Value(10),
  //         fileFormat: const Value([FileFormat.pdf]),
  //         requirements: const Value(
  //           'Требования к заявкам на участие в конференции 1',
  //         ),
  //       ),
  //     );

  // Firebase
  final firebaseAdminSDKApp = FirebaseAdmin.instance.initializeApp(
    AppOptions(
      credential: FirebaseAdmin.instance.certFromPath(
        config.pathToServiceAccount,
      ),
      projectId: 'article-b3280',
    ),
  );

  // Api Server
  final ApiServer apiServer = BaseApiServer();

  // Claims
  final IClaimsService claimsService = ClaimsService(
    firebaseAdminSDKApp: firebaseAdminSDKApp,
  );

  // User
  final IUserRepository userRepository = UserRepositoryImpl(
    appDatabase: appDatabase,
  );

  final userController = UserController(userRepository: userRepository);

  // Author
  final IAuthorRepository authorRepository = AuthorRepositoryImpl(
    appDatabase: appDatabase,
    claimsService: claimsService,
  );

  final authorController = AuthorController(
    authorRepository: authorRepository,
    apiServer: apiServer,
  );

  // Organization
  final IOrganizationRepository organizationRepository =
      OrganizationRepositoryImpl(appDatabase: appDatabase);

  final organizationController = OrganizationController(
    organizationRepository: organizationRepository,
    apiServer: apiServer,
  );

  // Request
  final IRequestRepository requestRepository = RequestRepositoryImpl(
    appDatabase: appDatabase,
  );

  final requestController = RequestController(
    requestRepository: requestRepository,
    apiServer: apiServer,
  );

  // Conference
  final IConferenceRepository conferenceRepository = ConferenceRepositoryImpl(
    appDatabase: appDatabase,
  );

  final conferenceController = ConferenceController(
    conferenceRepository: conferenceRepository,
    apiServer: apiServer,
  );

  return DependenciesContainer(
    logger: logger,
    apiServer: apiServer,
    firebaseAdminSDKApp: firebaseAdminSDKApp,
    config: config,
    userController: userController,
    authorController: authorController,
    organizationController: organizationController,
    requestController: requestController,
    conferenceController: conferenceController,
  );
}
