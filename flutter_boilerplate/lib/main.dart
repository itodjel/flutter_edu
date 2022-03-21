import 'package:flutter_boilerplate/_all.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rest_api_client/rest_api_client.dart';

late EnvironmentType environment;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await RestApiClient.initFlutter();

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
