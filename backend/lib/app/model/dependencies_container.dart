import 'package:firebase_admin/firebase_admin.dart';
import 'package:logger/web.dart';
import '../../router/controllers/user_controller.dart';
import 'application_config.dart';

class DependenciesContainer {
  const DependenciesContainer({
    required this.logger,
    required this.config,
    required this.firebaseAdminSDKApp,
    required this.userController,
  });
  final Logger logger;
  final ApplicationConfig config;
  final App firebaseAdminSDKApp;
  final UserController userController;
}
