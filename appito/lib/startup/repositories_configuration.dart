import 'package:appito/_all.dart';

class RepositoriesConfiguration {
  static void configure() {
    if (environment == Environment.demo) {
      configureDemo();
    } else {
      configureDefault();
    }
  }

  static void configureDemo() {
    services.registerSingleton<ICurrentUser>(MockCurrentUser());

    services.registerSingleton<IAuthenticationRepository>(
      MockAuthenticationRepository(
        restApiClient: services.get<IRestApiClient>(),
        currentUser: services.get<ICurrentUser>(),
      ),
    );

    services.registerSingleton<IAccountRepository>(MockAccountRepository());
  }

  static void configureDefault() {
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
