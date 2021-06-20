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
      builder: (context, localizationState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: MaterialApp(
                onGenerateTitle: (context) => context.translations.applicationName,
                navigatorKey: globalNavigatorKey,
                themeMode: themeState.themeMode,
                theme: AppTheme.light.theme,
                darkTheme: AppTheme.dark.theme,
                locale: localizationState.locale,
                debugShowCheckedModeBanner: false,
                localeResolutionCallback: Localizer.getSupportedLocale,
                localizationsDelegates: const [
                  Localizer.delegate,
                  Localizer.fallbackCupertinoLocalisationsDelegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                ],
                home: BlocListener<ErrorHandlerBloc, ErrorHandlerState>(
                  listener: (context, errorHandlerState) {
                    if (errorHandlerState.status == ErrorHandlerStateStatus.dirty && !errorHandlerState.exception!.silent) {
                      showExceptionMessage(context, errorHandlerState.exception!);
                    }
                  },
                  child: NavigationWrapper(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
