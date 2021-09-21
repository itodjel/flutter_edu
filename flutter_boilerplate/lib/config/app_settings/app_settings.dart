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
  final bool skipLogin;
  final bool skipAllowLocation;
  final ChatSettings chatSettings;
  final String googlePlacesApiKey;
  final LatLng defaultLocation;
  final ExceptionReportingSettings exceptionReportingSettings;
  final bool usingExceptionReporting;
  final String stripeCheckoutUrl;
  final String donationUrl;

  const AppSettings({
    this.name = 'Tailgreeter',
    this.description = 'Tailgreeter project',
    this.version = '1.0',
    this.versionDisplay = '1.0.0',
    this.baseApiUrl = '',
    this.stripeCheckoutUrl = '',
    this.logNetworkTraffic = true,
    this.keepRetryingOnNetworkError = true,
    this.providesOfflineMode = true,
    this.resetStorageOnRestart = false,
    this.onlyAllowOrientationPortrait = true,
    this.skipIntro = false,
    this.skipLogin = true,
    this.skipAllowLocation = false,
    this.chatSettings = const ChatSettings(),
    this.googlePlacesApiKey = 'AIzaSyAMSFjylO88m5bscGREvRjutJUUL8UkKYM',
    this.defaultLocation = const LatLng(37.2755783, -104.6571311),
    this.usingExceptionReporting = false,
    this.donationUrl = '',
    this.exceptionReportingSettings = const ExceptionReportingSettings(
      slackWebHookUrl: 'https://hooks.slack.com/services/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',
      slackChannel: '#exception_reporting_flutter_boilerplate',
      enableDeviceParameters: true,
      enableApplicationParameters: true,
      enableCustomParameters: true,
      enableStackTrace: true,
      printLogs: true,
    ),
  });
}
