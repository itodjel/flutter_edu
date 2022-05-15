import 'package:appito/_all.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, appNavigationState) {
        switch (appNavigationState.status) {
          case AppNavigationStateStatus.intro:
            return const Center(child: Text('Intro'));
          case AppNavigationStateStatus.signIn:
            return const SignInPage();
          case AppNavigationStateStatus.home:
            return const HomeNavigation();
        }
      },
    );
  }
}
