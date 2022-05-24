import 'package:appito/_all.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(settings: settings, builder: (_) => _onGenerateRoute(settings));
  }

  static Widget _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigation.route:
        return const AppNavigation();
      case SignInWithPhoneNumberPage.route:
        return SignInWithPhoneNumberPage(model: settings.arguments as SignInWithPhoneNumberPageModel);
      default:
        return const AppNavigation();
    }
  }
}
