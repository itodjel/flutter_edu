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
          case AppNavigationStep.root:
            return const AccountTypeNavigation();
        }
      },
    );
  }
}

class AccountTypeNavigation extends StatelessWidget {
  const AccountTypeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentUserBloc, CurrentUserState>(
      builder: (context, currentUserState) {
        if (currentUserState.status == CurrentUserStateStatus.initializing) {
          return const SplashPage();
        }

        switch (currentUserState.status) {
          case CurrentUserStateStatus.initializing:
            return const SplashPage();
          case CurrentUserStateStatus.initialized:
            switch (currentUserState.account?.accountType) {
              case AccountType.client:
                return const ClientHomeNavigation();
              case AccountType.partner:
                if (currentUserState.account?.currentCompany != null) {
                  return const PartnerHomeNavigation();
                } else {
                  return const ClientHomeNavigation();
                }
              case AccountType.admin:
                return const AdminHomeNavigation();
              default:
                return const SplashPage();
            }
          case CurrentUserStateStatus.unInitialized:
            return const SignInPage();
        }
      },
    );
  }
}
