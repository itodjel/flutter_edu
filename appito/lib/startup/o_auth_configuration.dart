import 'package:appito/_all.dart';

class OAuthConfiguration {
  static Future configure() async {
    if (PlatformService.isWeb) {
      // initialiaze the facebook javascript SDK
      await FacebookAuth.i.webInitialize(
        appId: services.get<AppSettings>().authSettings.facebookAppId,
        cookie: true,
        xfbml: true,
        version: "v13.0",
      );
    }
  }
}
