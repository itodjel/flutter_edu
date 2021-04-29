import 'package:flutter_boilerplate/all.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
    if (context.appSettings.onlyAllowOrientationPortrait) {
      setOrientationPortrait();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (BuildContext context, LocalizationState localizationState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (BuildContext context, ThemeState themeState) {
            return MaterialApp(
              onGenerateTitle: (context) => context.localizer.translations.applicationName,
              navigatorKey: globalNavigatorKey,
              themeMode: themeState.themeMode,
              theme: AppTheme.light.theme,
              darkTheme: AppTheme.dark.theme,
              locale: localizationState.locale,
              debugShowCheckedModeBanner: false,
              localeResolutionCallback: Localizer.getSupportedLocale,
              localizationsDelegates: [
                Localizer.delegate,
                Localizer.fallbackCupertinoLocalisationsDelegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              home: NavigationWrapper(),
            );
          },
        );
      },
    );
  }
}
