import 'package:appito/_all.dart';

class RepositoriesConfiguration {
  static Future configure() async {
    if (environment == Environment.demo) {
      await configureDemo();
    } else {
      await configureDefault();
    }
  }

  static Future configureDemo() async {
    services.registerSingleton<ICurrentUser>(MockCurrentUser());

    services.registerSingleton<IAuthenticationRepository>(
      MockAuthenticationRepository(
        restApiClient: services.get<IRestApiClient>(),
        currentUser: services.get<ICurrentUser>(),
      ),
    );

    services.registerSingleton<IAccountRepository>(MockAccountRepository());
  }

  static Future configureDefault() async {
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
      ),
    );

    services.registerSingleton<IAccountRepository>(AccountRepository(restApiClient: services.get<IRestApiClient>()));
  }
}
