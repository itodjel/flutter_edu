import 'package:flutter_boilerplate/all.dart';

class ContextServiceProviderBlocs extends StatelessWidget {
  final Widget child;

  ContextServiceProviderBlocs({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (BuildContext context) => AppBloc(
            appSettings: context.serviceProvider.appSettings,
            localizationBloc: context.localizationBloc,
            themeBloc: context.themeBloc,
          ),
        ),
        BlocProvider<ErrorHandlerBloc>(
          create: (BuildContext context) => ErrorHandlerBloc(
            restApiClient: context.serviceProvider.restApiClient,
          ),
        ),
        BlocProvider<LocalizationBloc>(
          create: (BuildContext context) => LocalizationBloc(
            restApiClient: context.serviceProvider.restApiClient,
            storageRepository: context.serviceProvider.storageRepository,
          ),
        ),
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(
            storageRepository: context.serviceProvider.storageRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}
