import 'package:flutter_boilerplate/all.dart';

class ContextServiceProviderBlocs extends StatelessWidget {
  final Widget child;

  const ContextServiceProviderBlocs({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(
            appSettings: context.serviceProvider.appSettings,
            localizationBloc: context.localizationBloc,
            themeBloc: context.themeBloc,
          ),
        ),
        BlocProvider<ErrorHandlerBloc>(
          create: (context) => ErrorHandlerBloc(
            restApiClient: context.serviceProvider.restApiClient,
          ),
        ),
        BlocProvider<LocalizationBloc>(
          create: (context) => LocalizationBloc(
            restApiClient: context.serviceProvider.restApiClient,
            storageRepository: context.serviceProvider.storageRepository,
          ),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            storageRepository: context.serviceProvider.storageRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}
