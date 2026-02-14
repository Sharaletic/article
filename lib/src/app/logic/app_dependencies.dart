import 'package:arcticle_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../feature/src/authentication/authentication.dart';
import '../../feature/src/athor/author.dart';
import '../app.dart';

abstract interface class IAppDependencies {
  Logger get logger;
  RestClient get restClientHttp;
  AuthenticationBloc get authenticationBloc;
  IAuthorRepository get authorRepository;
  Future<void> dispose();
}

final class AppDependencies implements IAppDependencies {
  AppDependencies._({
    required this.logger,
    required this.restClientHttp,
    required this.authenticationBloc,
    required this.authorRepository,
  });

  @override
  final Logger logger;

  @override
  final RestClient restClientHttp;

  @override
  final AuthenticationBloc authenticationBloc;

  @override
  final IAuthorRepository authorRepository;

  static Future<IAppDependencies> init({required Logger logger}) async {
    // Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Logger
    final initLogger = logger;

    // Config
    ApplicationConfig config = const ApplicationConfig();

    // RestClient
    RestClient restClientHttp = RestClientHttp(
      httpClient: httpClient(),
      baseUri: 'http://localhost:${config.port}',
    );

    // Authentication
    final IAuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(restClientHttp: restClientHttp);

    final AuthenticationBloc authenticationBloc = AuthenticationBloc(
      authenticationRepository: authenticationRepository,
    );

    // Author
    final IAuthorRepository authorRepository = AuthorRepositoryImpl(
      httpClient: restClientHttp,
    );

    return AppDependencies._(
      logger: initLogger,
      restClientHttp: restClientHttp,
      authenticationBloc: authenticationBloc,
      authorRepository: authorRepository,
    );
  }

  @override
  Future<void> dispose() async {
    await [logger.close(), authenticationBloc.close()].wait;
  }
}
