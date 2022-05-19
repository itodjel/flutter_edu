import 'package:appito/_all.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future main(args) async {
  await Startup.configure();

  BlocOverrides.runZoned(
    () => runZonedGuarded(
      () => runApp(const App()),
      (error, stack) {
        if (services.get<AppSettings>().useFirebase) {
          FirebaseCrashlytics.instance.recordError(error, stack);
        }
      },
    ),
    blocObserver: AppBlocObserver(),
  );
}
