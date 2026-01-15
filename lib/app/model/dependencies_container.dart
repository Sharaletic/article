import 'package:logger/logger.dart';
import '../app.dart';

class DependenciesContainer {
  const DependenciesContainer({required this.logger, required this.config});
  final Logger logger;
  final ApplicationConfig config;
}
