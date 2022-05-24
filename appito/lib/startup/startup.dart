import 'package:appito/_all.dart';

GetIt services = GetIt.instance;
Environment environment = Environment.values[int.tryParse(const String.fromEnvironment('environment')) ?? Environment.production.index];

class Startup {
  static Future configure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await RestApiClient.initFlutter();

    AppSettingsConfiguration.configure();
    CommonServicesConfiguration.configure();
    await StorageConfiguration.configure();
    await FirebaseConfiguration.configure();
    await OAuthConfiguration.configure();
    await ApiClientConfiguration.configure();
    RepositoriesConfiguration.configure();
    BlocsConfiguration.configure();
  }

  static Future restart() async {
    await services.reset();

    ModelValidatorsConfiguration.configuredValidators = false;

    await configure();
  }
}
