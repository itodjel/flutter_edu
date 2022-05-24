import 'package:appito/_all.dart';

Future main(args) async {
  await Startup.configure();

  BlocOverrides.runZoned(
    () => runZonedGuarded(
      () => runApp(const App()),
      (error, stack) {
        if (services.get<IPlatformService>().isFirebaseAvailable) {
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        }
      },
    ),
    blocObserver: AppBlocObserver(),
  );
}
