import 'package:flutter_boilerplate/_all.dart';

class AppSettings {
  final String name;
  final String description;
  final String version;
  final String versionDisplay;
  final String baseApiUrl;
  final bool logNetworkTraffic;
  final bool keepRetryingOnNetworkError;
  final bool providesOfflineMode;
  final bool resetStorageOnRestart;
  final bool onlyAllowOrientationPortrait;
  final bool skipIntro;
  final bool skipAllowLocation;
  final bool skipSignIn;
  final String googlePlacesApiKey;
  final LocationModel defaultLocation;
  final bool usingExceptionReporting;
  final ExceptionReportingSettings exceptionReportingSettings;

  const AppSettings({
    this.name = 'Flutter Boilerplate',
    this.description = 'Flutter Boilerplate project',
    this.version = '1.0',
    this.versionDisplay = '1.0.0',
    this.baseApiUrl = '',
    this.logNetworkTraffic = true,
    this.keepRetryingOnNetworkError = true,
    this.providesOfflineMode = true,
    this.resetStorageOnRestart = false,
    this.onlyAllowOrientationPortrait = true,
    this.skipIntro = false,
    this.skipAllowLocation = false,
    this.skipSignIn = false,
    this.googlePlacesApiKey = '<YOUR_GOOGLE_PLACES_API_KEY_HERE>',
    this.defaultLocation = const LocationModel(latitude: 37.2755783, longitude: -104.6571311),
    this.usingExceptionReporting = false,
    this.exceptionReportingSettings = const ExceptionReportingSettings(
      slackWebHookUrl: 'https://hooks.slack.com/services/<YOUR_TOKEN_HERE>',
      slackChannel: '#exception_reporting_flutter_boilerplate',
      enableDeviceParameters: true,
      enableApplicationParameters: true,
      enableCustomParameters: true,
      enableStackTrace: true,
      printLogs: true,
    ),
  });
}
