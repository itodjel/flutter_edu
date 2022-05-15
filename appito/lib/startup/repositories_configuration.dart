import 'package:appito/_all.dart';

class RepositoriesConfiguration {
  static Future configure() async {
    services.registerSingleton<IAuthenticationRepository>(AuthenticationRepository(restApiClient: services.get<IRestApiClient>()));
  }
}
