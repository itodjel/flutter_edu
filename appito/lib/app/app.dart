import 'package:appito/_all.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: const AppBlocs(
        child: AppRebuilder(
          child: AnimatedFadeIn(
            child: _AppLayoutBuilder(),
          ),
        ),
      ),
    );
  }
}

class AppRebuilder extends StatelessWidget {
  final Widget child;

  const AppRebuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if ([AuthStateStatus.refreshedSignIn, AuthStateStatus.signedOut].contains(authState.status)) {
          context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: 0));
          Phoenix.rebirth(context);
        }
      },
      child: child,
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
          small: (_, __) => _App(theme: AppTheme.small, darkTheme: AppTheme.smallDark, themeMode: themeState.themeMode),
          medium: (_, __) => _App(theme: AppTheme.medium, darkTheme: AppTheme.mediumDark, themeMode: themeState.themeMode),
          large: (_, __) => _App(theme: AppTheme.large, darkTheme: AppTheme.largeDark, themeMode: themeState.themeMode),
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
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();

              return true;
            },
            child: MaterialApp(
              title: 'Appito',
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

                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                  systemNavigationBarColor: context.theme.primaryColor,
                  statusBarColor: context.theme.primaryColor,
                ));

                return BlocListener<ErrorHandlerBloc, ErrorHandlerState>(
                  listener: (context, errorHandlerState) {
                    if (errorHandlerState.showMessage) {
                      context.toast.showExceptionMessage(context.translations, errorHandlerState.exception!);
                    }
                  },
                  child: child!,
                );
              },
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: AppNavigation.route,
            ),
          );
        },
      ),
    );
  }
}
