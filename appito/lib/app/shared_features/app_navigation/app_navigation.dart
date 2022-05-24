import 'package:appito/_all.dart';

class AppNavigation extends StatelessWidget {
  static const route = '/';

  const AppNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, appNavigationState) {
        switch (appNavigationState.status) {
          case AppNavigationStateStatus.initial:
            return const SplashPage();
          case AppNavigationStateStatus.selectLanguage:
            return const SelectLanguagePage();
          case AppNavigationStateStatus.intro:
            return IntroPage();
          case AppNavigationStateStatus.signIn:
            return const SignInPage();
          case AppNavigationStateStatus.home:
            return const HomeNavigation();
        }
      },
    );
  }
}
