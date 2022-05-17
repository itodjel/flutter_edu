import 'package:appito/_all.dart';

class RepositoriesConfiguration {
  static Future configure() async {
    // Real repo to use when we want to authenticate via our API
    // services.registerSingleton<IAuthenticationRepository>(AuthenticationRepository(restApiClient: services.get<IRestApiClient>()));

    // Mock repo to use when there is no API to fake user sign in
    services.registerSingleton<IAuthenticationRepository>(MockAuthenticationRepository(restApiClient: services.get<IRestApiClient>()));
  }
}
