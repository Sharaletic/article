class ApplicationConfig {
  const ApplicationConfig();

  String get port => const String.fromEnvironment('PORT', defaultValue: '8080');

  String get pathToServiceAccount => const String.fromEnvironment(
    'service-account',
    defaultValue: 'bin/service-account.json',
  );
}
