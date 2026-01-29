class ApplicationConfig {
  const ApplicationConfig();

  String get port => const String.fromEnvironment('PORT', defaultValue: '8080');
}
