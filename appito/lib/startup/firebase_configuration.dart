import 'package:appito/_all.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfiguration {
  static Future configure() async {
    if (services.get<AppSettings>().useFirebase) {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    }
  }
}
