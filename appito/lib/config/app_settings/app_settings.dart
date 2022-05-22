import 'package:appito/_all.dart';

class AppSettings {
  final String baseApiUrl;
  final bool resetStorageOnRestart;
  final LoggingOptions loggingOptions;
  final AuthSettings authSettings;

  AppSettings({
    this.baseApiUrl = '<BASE_URL>',
    this.resetStorageOnRestart = false,
    this.loggingOptions = const LoggingOptions(
      logCacheStorage: false,
    ),
    this.authSettings = const AuthSettings(),
  });
}
