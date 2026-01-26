import 'package:arcticle_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../feature/src/authentication/authentication.dart';
import '../app.dart';

abstract interface class IAppDependencies {
  Logger get logger;
  RestClientHttp get restClientHttp;
  AuthenticationBloc get authenticationBloc;
  Future<void> dispose();
}

final class AppDependencies implements IAppDependencies {
  AppDependencies._({
    required this.logger,
    required this.restClientHttp,
    required this.authenticationBloc,
  });

  @override
  final Logger logger;

  @override
  final RestClientHttp restClientHttp;

  @override
  final AuthenticationBloc authenticationBloc;

  static Future<IAppDependencies> init({required Logger logger}) async {
    // Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Logger
    final initLogger = logger;

    // Config
    ApplicationConfig config = ApplicationConfig();

    // RestClient
    RestClientHttp restClientHttp = RestClientHttp(
      httpClient: httpClient(),
      baseUri: 'http://localhost:${config.port}',
    );

    // Authentication
    final IAuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(httpClient: restClientHttp.httpClient);

    final AuthenticationBloc authenticationBloc = AuthenticationBloc(
      authenticationRepository: authenticationRepository,
    );

    return AppDependencies._(
      logger: initLogger,
      restClientHttp: restClientHttp,
      authenticationBloc: authenticationBloc,
    );
  }

  @override
  Future<void> dispose() async {
    await [logger.close(), authenticationBloc.close()].wait;
  }
}
