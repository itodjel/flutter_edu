import 'package:appito/_all.dart';

class AppSettings {
  final String baseApiUrl;
  final bool useFirebase;
  final bool resetStorageOnRestart;
  final LoggingOptions loggingOptions;

  AppSettings({
    this.baseApiUrl = '<BASE_URL>',
    this.useFirebase = false,
    this.resetStorageOnRestart = false,
    this.loggingOptions = const LoggingOptions(
      logCacheStorage: false,
    ),
  });
}
