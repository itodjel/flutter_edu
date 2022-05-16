import 'package:appito/_all.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppBlocs(
      child: AnimatedFadeIn(
        child: _AppLayoutBuilder(),
      ),
    );
  }
}

class _AppLayoutBuilder extends StatelessWidget {
  const _AppLayoutBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return ResponsiveLayoutBuilder(
          small: (_, __) => _App(theme: AppoloTheme.small, darkTheme: AppoloTheme.smallDark, themeMode: themeState.themeMode),
          medium: (_, __) => _App(theme: AppoloTheme.medium, darkTheme: AppoloTheme.mediumDark, themeMode: themeState.themeMode),
          large: (_, __) => _App(theme: AppoloTheme.large, darkTheme: AppoloTheme.largeDark, themeMode: themeState.themeMode),
        );
      },
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    Key? key,
    required this.theme,
    required this.darkTheme,
    required this.themeMode,
  }) : super(key: key);

  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return DismissFocusOverlay(
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localizationState) {
          return MaterialApp(
            title: 'Appolo',
            theme: theme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            locale: localizationState.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: globalNavigatorKey,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              ModelValidatorsConfiguration.configure(context.translations);

              return child!;
            },
            home: BlocListener<ErrorHandlerBloc, ErrorHandlerState>(
              listener: (context, errorHandlerState) {
                if (errorHandlerState.showMessage) {
                  toast.showExceptionMessage(context.translations, errorHandlerState.exception!);
                }
              },
              child: const AppNavigation(),
            ),
          );
        },
      ),
    );
  }
}
