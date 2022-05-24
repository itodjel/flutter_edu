import 'package:appito/_all.dart';

class FirebaseConfiguration {
  static Future configure() async {
    if (services.get<IPlatformService>().isFirebaseAvailable) {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    }
  }
}
