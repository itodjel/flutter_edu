import 'package:appito/_all.dart';

AppSettings developmentAppSettings = AppSettings(
  baseApiUrl: 'https://54f4-37-203-120-185.eu.ngrok.io',
  resetStorageOnRestart: false,
  authSettings: const AuthSettings(
    appleServiceId: 'com.nucleus.appolo.service',
    appleRedirectUrl: 'https://dc76-92-36-186-127.eu.ngrok.io/api/Authentication/apple-redirect',
  ),
);
