import 'package:appito/_all.dart';

class BlocsConfiguration {
  static void configure() {
    configureSingletons();
    configureScoped();
  }

  static void configureSingletons() {
    services.registerSingleton(
      IntroBloc(
        storageRepository: services.get<IStorageRepository>(),
      ),
    );
    services.registerSingleton(
      LocalizationBloc(
        restApiClient: services.get<IRestApiClient>(),
        storageRepository: services.get<IStorageRepository>(),
      ),
    );
    services.registerSingleton(
      AuthBloc(
        currentUser: services.get<ICurrentUser>(),
        restApiClient: services.get<IRestApiClient>(),
        authenticationRepository: services.get<IAuthenticationRepository>(),
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
        introBloc: services.get<IntroBloc>(),
        localizationBloc: services.get<LocalizationBloc>(),
        authBloc: services.get<AuthBloc>(),
      ),
    );
  }

  static void configureScoped() {
    services.registerFactory(
      () => AccountBloc(
        accountRepository: services.get<IAccountRepository>(),
      ),
    );
    services.registerFactory(
      () => SignInBloc(
        signInRequestModelValidator: services.get<SignInRequestModelValidator>(),
        authenticationRepository: services.get<IAuthenticationRepository>(),
      ),
    );
    services.registerFactory(
      () => ExternalSignInBloc(
        authenticationRepository: services.get<IAuthenticationRepository>(),
      ),
    );
  }
}
