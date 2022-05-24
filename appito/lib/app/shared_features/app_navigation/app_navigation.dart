import 'package:appito/_all.dart';

class AppNavigation extends StatelessWidget {
  static const route = '/';

  const AppNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, appNavigationState) {
        switch (appNavigationState.currentStep) {
          case AppNavigationStep.selectLanguage:
            return const SelectLanguagePage();
          case AppNavigationStep.intro:
            return IntroPage();
          case AppNavigationStep.signIn:
            return const SignInPage();
          case AppNavigationStep.home:
            return const HomeNavigation();
        }
      },
    );
  }
}
