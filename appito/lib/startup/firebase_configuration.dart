import 'package:appito/_all.dart';

class FirebaseConfiguration {
  static Future configure() async {
    if (PlatformService.isFirebaseAvailable) {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    }
  }
}
