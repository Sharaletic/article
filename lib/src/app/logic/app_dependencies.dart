import 'package:arcticle_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import '../../core/core.dart';
import '../../feature/src/authentication/authentication.dart';
import '../../feature/src/athor/author.dart';
import '../app.dart';

abstract interface class IAppDependencies {
  Logger get logger;
  AppRouter get router;
  RestClient get restClientHttp;
  IAuthenticationRepository get authenticationRepository;
  IAuthorRepository get authorRepository;
  IOrganizationRepository get organizationRepository;
  Future<void> dispose();
}

final class AppDependencies implements IAppDependencies {
  AppDependencies._({
    required this.logger,
    required this.router,
    required this.restClientHttp,
    required this.authenticationRepository,
    required this.authorRepository,
    required this.organizationRepository,
  });

  @override
  final Logger logger;

  @override
  final AppRouter router;

  @override
  final RestClient restClientHttp;

  @override
  final IAuthenticationRepository authenticationRepository;

  @override
  final IAuthorRepository authorRepository;

  @override
  final IOrganizationRepository organizationRepository;

  static Future<IAppDependencies> init({
    required Logger logger,
    required AppRouter router,
  }) async {
    // Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Logger
    final initLogger = logger;

    // Router
    final initRouter = router;

    // Config
    ApplicationConfig config = const ApplicationConfig();

    // RestClient
    RestClient restClientHttp = RestClientHttp(
      httpClient: createDefaultHttpClient(),
      baseUri: 'http://localhost:${config.port}',
      logger: logger,
    );

    // Authentication
    final IAuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(restClientHttp: restClientHttp);

    // Author
    final IAuthorRepository authorRepository = AuthorRepositoryImpl(
      httpClient: restClientHttp,
    );

    final IOrganizationRepository organizationRepository =
        OrganizationRepositoryImpl(httpClient: restClientHttp, logger: logger);

    return AppDependencies._(
      logger: initLogger,
      router: initRouter,
      restClientHttp: restClientHttp,
      authenticationRepository: authenticationRepository,
      authorRepository: authorRepository,
      organizationRepository: organizationRepository,
    );
  }

  @override
  Future<void> dispose() async {
    await [logger.close()].wait;
  }
}
