import 'package:appito/_all.dart';

AppSettings developmentAppSettings = AppSettings(
  baseApiUrl: 'https://a31f-92-36-185-223.eu.ngrok.io',
  resetStorageOnRestart: false,
  authSettings: const AuthSettings(
    appleServiceId: 'com.ito.appito.service',
    appleRedirectUrl: 'https://dc76-92-36-186-127.eu.ngrok.io/api/Authentication/apple-redirect',
  ),
);
