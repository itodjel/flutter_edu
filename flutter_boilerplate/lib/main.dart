import 'package:catcher/catcher.dart';
import 'package:flutter_boilerplate/_all.dart';

late EnvironmentType environment;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceProvider = await resolveServiceProviderFromEnvironment();

  final rootWidget = RepositoryProvider<ServiceProvider>(
    create: (context) => serviceProvider,
    child: Application(),
  );

  if (serviceProvider.appSettings.usingExceptionReporting) {
    Catcher(
      debugConfig: serviceProvider.catcherOptions,
      releaseConfig: serviceProvider.catcherOptions,
      rootWidget: rootWidget,
    );
  } else {
    runZoned(() => runApp(rootWidget));
  }
}
