import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

enum _Platform {
  android,
  ios,
  web,
  windows,
  linux,
  macos,
}

class PlatformService {
  static bool isGoogleSignInAvailable = isAndroidIosWeb;
  static bool isFacebookSignInAvailable = isAndroidIosWeb;
  static bool isAppleSignInAvailable = isAndroidIosWeb;
  static bool isFirebaseAvailable = isAndroidIos;

  // Helpers - BEGIN

  static bool isWeb = kIsWeb;

  static bool isAndroidIosWeb = [
    _Platform.android,
    _Platform.ios,
    _Platform.web,
  ].contains(_currentPlatform);

  static bool isAndroidIos = [
    _Platform.android,
    _Platform.ios,
  ].contains(_currentPlatform);

  static _Platform get _currentPlatform {
    if (kIsWeb) {
      return _Platform.web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _Platform.android;
      case TargetPlatform.iOS:
        return _Platform.ios;
      case TargetPlatform.macOS:
        return _Platform.macos;
      case TargetPlatform.windows:
        return _Platform.windows;
      case TargetPlatform.linux:
        return _Platform.linux;
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  // Helpers - END
}
