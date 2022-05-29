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
        restApiClient: services.get<IRestApiClient>(),
        authenticationRepository: services.get<IAuthenticationRepository>(),
      ),
    );
    services.registerSingleton(
      CurrentUserBloc(
        authBloc: services.get<AuthBloc>(),
        currentUser: services.get<ICurrentUser>(),
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
        currentUser: services.get<ICurrentUser>(),
      ),
    );
    services.registerFactory(
      () => AccountUpdateBloc(
        accountRepository: services.get<IAccountRepository>(),
        modelValidator: services.get<AccountUpdateRequestModelValidator>(),
      ),
    );
    services.registerFactory(
      () => SignInBloc(
        authenticationRepository: services.get<IAuthenticationRepository>(),
        modelValidator: services.get<SignInRequestModelValidator>(),
      ),
    );
    services.registerFactory(
      () => SendVerificationCodeBloc(
        authenticationRepository: services.get<IAuthenticationRepository>(),
        modelValidator: services.get<SendVerificationCodeRequestModelValidator>(),
      ),
    );
    services.registerFactory(
      () => ExternalSignInBloc(
        authenticationRepository: services.get<IAuthenticationRepository>(),
        modelValidator: services.get<SignInWithExternalProviderRequestModelValidator>(),
      ),
    );
    services.registerFactory(
      () => ChangePasswordBloc(
        accountRepository: services.get<IAccountRepository>(),
        modelValidator: services.get<ChangePasswordRequestModelValidator>(),
      ),
    );
    services.registerFactory(
      () => BecomeAPartnerBloc(
        accountRepository: services.get<IAccountRepository>(),
      ),
    );
    services.registerFactory(
      () => SignUpBloc(
        accountRepository: services.get<IAccountRepository>(),
        modelValidator: services.get<SignUpRequestModelValidator>(),
      ),
    );
  }
}
