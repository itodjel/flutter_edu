import 'package:appito/_all.dart';

class AppSettingsConfiguration {
  static Future configure() async {
    switch (environment) {
      case Environment.demo:
        services.registerSingleton<AppSettings>(demoAppSettings);
        break;
      case Environment.development:
        services.registerSingleton<AppSettings>(developmentAppSettings);
        break;
      case Environment.staging:
        services.registerSingleton<AppSettings>(stagingAppSettings);
        break;
      case Environment.production:
        services.registerSingleton<AppSettings>(productionAppSettings);
        break;
    }
  }
}
