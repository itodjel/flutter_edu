import 'package:appito/_all.dart';

class BlocsConfiguration {
  static Future configure() async {
    await configureSingletons();
    await configureScoped();
  }

  static Future configureSingletons() async {
    services.registerSingleton(
      AuthBloc(
        authenticationRepository: services.get<IAuthenticationRepository>(),
      ),
    );
    services.registerSingleton(
      LocalizationBloc(
        restApiClient: services.get<IRestApiClient>(),
        storageRepository: services.get<IStorageRepository>(),
      ),
    );
    services.registerSingleton(
      ErrorHandlerBloc(
        restApiClient: services.get<IRestApiClient>(),
      ),
    );
    services.registerSingleton(
      NavigationBloc(),
    );
    services.registerSingleton(
      ThemeBloc(
        storageRepository: services.get<IStorageRepository>(),
      ),
    );
    services.registerSingleton(
      AppNavigationBloc(
        authBloc: services.get<AuthBloc>(),
        localizationBloc: services.get<LocalizationBloc>(),
      ),
    );
  }

  static Future configureScoped() async {
    services.registerFactory<SignInBloc>(
      () => SignInBloc(
        signInRequestModelValidator: services.get<SignInRequestModelValidator>(),
        authenticationRepository: services.get<IAuthenticationRepository>(),
      ),
    );
  }
}
