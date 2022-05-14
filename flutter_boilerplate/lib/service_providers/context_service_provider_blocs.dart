import 'package:flutter_boilerplate/_all.dart';

class ContextServiceProviderBlocs extends StatelessWidget {
  final Widget child;

  const ContextServiceProviderBlocs({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ! Keep Blocs sorted by dependencies (only dependencies to other Blocs)
      providers: [
        // *
        // * Without dependencies
        // *
        BlocProvider<ConnectivityBloc>(
          lazy: false,
          create: (BuildContext context) => ConnectivityBloc(
            appSettings: context.appSettings,
          ),
        ),
        BlocProvider<ErrorHandlerBloc>(
          create: (BuildContext context) => ErrorHandlerBloc(
            restApiClient: context.serviceProvider.restApiClient,
          ),
        ),
        BlocProvider<LocalizationBloc>(
          lazy: false,
          create: (BuildContext context) => LocalizationBloc(
            restApiClient: context.serviceProvider.restApiClient,
            storageRepository: context.serviceProvider.storageRepository,
          )..add(LocalizationInitEvent()),
        ),
        BlocProvider<LocationBloc>(
          lazy: false,
          create: (BuildContext context) => LocationBloc(
            locationRepository: context.serviceProvider.locationRepository,
          ),
        ),
        BlocProvider<SignInBloc>(
          create: (BuildContext context) => SignInBloc(
            authenticationRepository: context.serviceProvider.authenticationRepository,
          ),
        ),
        BlocProvider<NavigationBloc>(
          lazy: false,
          create: (BuildContext context) => NavigationBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(
            accountRepository: context.serviceProvider.accountRepository,
          ),
        ),
        BlocProvider<ThemeBloc>(
          lazy: false,
          create: (BuildContext context) => ThemeBloc(
            storageRepository: context.serviceProvider.storageRepository,
          )..add(ThemeInitEvent()),
        ),
        BlocProvider<IntroductionBloc>(
          lazy: false,
          create: (BuildContext context) => IntroductionBloc(
            storageRepository: context.serviceProvider.storageRepository,
          )..add(IntroductionInitEvent()),
        ),
        BlocProvider<GalleryBloc>(
          create: (BuildContext context) => GalleryBloc(
            galleryRepository: context.serviceProvider.galleryRepository,
          ),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (BuildContext context) => ResetPasswordBloc(),
        ),
        // *
        // * With dependencies
        // *
        BlocProvider<AuthenticationBloc>(
          lazy: false,
          create: (BuildContext context) => AuthenticationBloc(
            authenticationRepository: context.serviceProvider.authenticationRepository,
            accountRepository: context.serviceProvider.accountRepository,
            storageRepository: context.serviceProvider.storageRepository,
          )..add(AuthenticationCheckEvent()),
        ),
        BlocProvider<AuthorizationBloc>(
          lazy: false,
          create: (BuildContext context) => AuthorizationBloc(
            authenticationRepository: context.serviceProvider.authenticationRepository,
            authenticationBloc: context.authenticationBloc,
          )..add(AuthorizationCheckEvent()),
        ),
        BlocProvider<ConfigurationBloc>(
          lazy: false,
          create: (BuildContext context) => ConfigurationBloc(
            authenticationBloc: context.authenticationBloc,
            locationBloc: context.locationBloc,
          ),
        ),
        BlocProvider<AppBloc>(
          lazy: false,
          create: (BuildContext context) => AppBloc(
            appSettings: context.serviceProvider.appSettings,
            authenticationBloc: context.authenticationBloc,
            authorizationBloc: context.authorizationBloc,
            themeBloc: context.themeBloc,
            locationBloc: context.locationBloc,
            localizationBloc: context.localizationBloc,
            connectivityBloc: context.connectivityBloc,
            configurationBloc: context.configurationBloc,
          ),
        ),
      ],
      child: child,
    );
  }
}
