import 'package:appito/_all.dart';

GetIt services = GetIt.instance;
Environment environment = Environment.values[int.tryParse(const String.fromEnvironment('environment')) ?? Environment.production.index];

class Startup {
  static Future configure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await RestApiClient.initFlutter();

    await StorageConfiguration.configure();
    await AppSettingsConfiguration.configure();
    await CommonServicesConfiguration.configure();
    await FirebaseConfiguration.configure();
    await ApiClientConfiguration.configure();
    await RepositoriesConfiguration.configure();
    await BlocsConfiguration.configure();
  }
}
