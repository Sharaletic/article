import 'package:firebase_admin/firebase_admin.dart';
import 'package:logger/web.dart';
import '../../core/rest_client/api_server.dart';
import '../../router/router.dart';
import 'application_config.dart';

class DependenciesContainer {
  const DependenciesContainer({
    required this.logger,
    required this.apiServer,
    required this.config,
    required this.firebaseAdminSDKApp,
    required this.userController,
    required this.authorController,
    required this.organizationController,
  });
  final Logger logger;
  final ApiServer apiServer;
  final ApplicationConfig config;
  final App firebaseAdminSDKApp;
  final UserController userController;
  final AuthorController authorController;
  final OrganizationController organizationController;
}
