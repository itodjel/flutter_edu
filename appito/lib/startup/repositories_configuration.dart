import 'package:appito/_all.dart';

class RepositoriesConfiguration {
  static void configure() {
    services.registerSingleton<ICurrentUser>(
      CurrentUser(
        storage: services.get<IStorageRepository>(),
        restApiClient: services.get<IRestApiClient>(),
      ),
    );

    services.registerSingleton<IAuthenticationRepository>(
      AuthenticationRepository(
        restApiClient: services.get<IRestApiClient>(),
        currentUser: services.get<ICurrentUser>(),
        appSettings: services.get<AppSettings>(),
      ),
    );

    services.registerSingleton<IAccountRepository>(AccountRepository(restApiClient: services.get<IRestApiClient>()));
  }
}
