import 'package:flutter_boilerplate/_all.dart';

class ApplicationNavigationWrapper extends StatefulWidget {
  static const route = '/';

  @override
  _ApplicationNavigationWrapperState createState() => _ApplicationNavigationWrapperState();
}

class _ApplicationNavigationWrapperState extends State<ApplicationNavigationWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return Stack(
          children: [
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, authState) => _maybeShowSignInPage(context),
              builder: (context, authState) {
                return BlocConsumer<IntroductionBloc, IntroductionState>(
                  listener: (context, introductionState) => _maybeShowSignInPage(context),
                  builder: (context, introductionState) {
                    if (!introductionState.isIntroSeen && !context.appSettings.skipIntro) {
                      return IntroductionPage();
                    }

                    return BlocConsumer<LocationBloc, LocationState>(
                      listener: (context, locationState) => _maybeShowAllowLocationPage(),
                      builder: (context, state) {
                        return NavigationWrapper();
                      },
                    );
                  },
                );
              },
            ),
            if (appState.status == AppStateStatus.loading) const SplashPage()
          ],
        );
      },
    );
  }

  void _maybeShowSignInPage(BuildContext context) {
    final authState = context.authBloc.state;
    final introductionState = context.introductionBloc.state;

    if (authState.status == AuthStateStatus.unAuthenticated && introductionState.status == IntroductionStateStatus.loaded && introductionState.isIntroSeen && !context.appSettings.skipSignIn) {
      context.navigator.pushNamed(SignInPage.route);
    }
  }

  void _maybeShowAllowLocationPage() {
    //TODO: Uncomment these lines of code if there is a requirement for the app to access users location, for now it is not a requirement
    // final locationState = context.locationBloc.state;

    // if (locationState.status == LocationStateStatus.notAllowed) {
    //   context.pushPage(AllowLocationPage());
    // }
  }
}
