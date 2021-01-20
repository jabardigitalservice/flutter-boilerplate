/// Use this class as your Environment specific config all over the project.
///
/// Pass multiple custom key/value pairs
/// Run the flutter app with the following arguments
/// flutter run --dart-define=BASE_URL=BASE_URL_VALUE --dart-define=STORAGE_URL=STORAGE_URL_VALUE
///
/// https://itnext.io/flutter-1-17-no-more-flavors-no-more-ios-schemas-command-argument-that-solves-everything-8b145ed4285d
class EnvironmentConfig {
  // Base URL
  static const BASE_URL = String.fromEnvironment('BASE_URL');

  // Storage URL
  static const STORAGE_URL = String.fromEnvironment('STORAGE_URL');

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;
}