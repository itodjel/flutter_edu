import 'package:flutter_boilerplate/_all.dart';
import 'package:intl/intl.dart';

late EnvironmentType environment;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceProvider = ServiceProvider();
  await serviceProvider.init();

  setSystemUIOverlayStyle();

  Intl.defaultLocale = Localizer.defaultLanguage.locale.languageCode;

  runZoned(() {
    runApp(
      RepositoryProvider<ServiceProvider>(
        create: (context) => serviceProvider,
        child: ContextServiceProviderBlocs(
          child: Application(),
        ),
      ),
    );
  });
}
