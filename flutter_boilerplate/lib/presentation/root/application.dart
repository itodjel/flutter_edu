import 'package:flutter/physics.dart';
import 'package:flutter_boilerplate/_all.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'application_navigation_wrapper.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
    globalNavigatorKey = context.appSettings.usingExceptionReporting ? Catcher.navigatorKey! : GlobalKey<NavigatorState>();
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
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: DismissFocusOverlay(
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
                  builder: (context, child) {
                    context.localizer.changeLanguage(localizationState.locale);

                    return AppTheme(
                      appTheme: context.theme.brightness == Brightness.light ? AppTheme.light : AppTheme.dark,
                      child: RefreshConfiguration(
                        headerBuilder: () => ClassicHeader(
                          refreshingIcon: const Loader.sm(),
                          completeText: context.localizer.translations.successfullyRefreshed,
                          refreshingText: context.localizer.translations.refreshing,
                          releaseText: context.localizer.translations.releaseToRefresh,
                          idleText: context.localizer.translations.pullDownToRefresh,
                        ),
                        footerBuilder: () => ClassicFooter(
                          loadingIcon: const Loader.sm(),
                          canLoadingText: context.localizer.translations.releaseToLoadMore,
                          loadingText: context.localizer.translations.loading,
                          idleText: context.localizer.translations.pullToLoadMore,
                          idleIcon: Container(),
                          noMoreIcon: NoContent(),
                        ),
                        headerTriggerDistance: 80.0,
                        springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
                        maxOverScrollExtent: 100,
                        maxUnderScrollExtent: 0,
                        enableScrollWhenRefreshCompleted: true,
                        enableLoadingWhenFailed: true,
                        hideFooterWhenNotFull: false,
                        enableBallisticLoad: true,
                        child: ContextServiceProviderModelValidator(child: child),
                      ),
                    );
                  },
                  home: BlocListener<ErrorHandlerBloc, ErrorHandlerState>(
                    listener: (context, errorHandlerState) {
                      if (errorHandlerState.status == ErrorHandlerStateStatus.dirty && errorHandlerState.exception != null && !errorHandlerState.exception!.silent) {
                        showExceptionMessage(context, errorHandlerState.exception!);
                      }
                    },
                    child: ApplicationNavigationWrapper(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
