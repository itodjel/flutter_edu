import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

enum _Platform {
  android,
  ios,
  web,
  windows,
  linux,
  macOS,
}

abstract class IPlatformService {
  bool get isWeb;
  bool get isAndroid;
  bool get isIos;
  bool get isWindows;
  bool get isMacOS;
  bool get isLinux;
  bool get isGoogleSignInAvailable;
  bool get isFacebookSignInAvailable;
  bool get isAppleSignInAvailable;
  bool get isFirebaseAvailable;
}

class PlatformService implements IPlatformService {
  @override
  bool get isGoogleSignInAvailable => isAndroid || isIos || isWeb;
  @override
  bool get isFacebookSignInAvailable => isAndroid || isIos || isWeb;
  @override
  bool get isAppleSignInAvailable => isAndroid || isIos || isWeb;
  @override
  bool get isFirebaseAvailable => isAndroid || isIos;
  @override
  bool get isWeb => kIsWeb;
  @override
  bool get isAndroid => _currentPlatform == _Platform.android;
  @override
  bool get isIos => _currentPlatform == _Platform.ios;
  @override
  bool get isWindows => _currentPlatform == _Platform.windows;
  @override
  bool get isMacOS => _currentPlatform == _Platform.macOS;
  @override
  bool get isLinux => _currentPlatform == _Platform.linux;

  _Platform get _currentPlatform {
    if (kIsWeb) {
      return _Platform.web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _Platform.android;
      case TargetPlatform.iOS:
        return _Platform.ios;
      case TargetPlatform.macOS:
        return _Platform.macOS;
      case TargetPlatform.windows:
        return _Platform.windows;
      case TargetPlatform.linux:
        return _Platform.linux;
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }
}
