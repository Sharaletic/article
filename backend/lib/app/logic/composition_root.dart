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
  //       ConferenceDto(
  //         title: 'Город, природа и человек: проблемы и возможности развития',
  //         shortDescription: 'Краткое описание конференции 1',
  //         startConferenceDate: DateTime(2023, 10, 1),
  //         endConferenceDate: DateTime(2023, 10, 5),
  //         address: 'Красноярский край, г Красноярск, пр-кт Мира, д 82',
  //         conferenceFormat: [ConferenceFormat.online],
  //         submissionStartDate: DateTime(2023, 8, 1),
  //         submissionEndDate: DateTime(2023, 8, 31),
  //         quantityOfPages: 10,
  //         fileFormat: [FileFormat.pdf],
  //         requirements: 'Требования к заявкам на участие в конференции 1',
  //       ).toCompanion(),
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
