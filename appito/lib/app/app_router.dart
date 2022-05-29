import 'package:appito/_all.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(settings: settings, builder: (_) => _onGenerateRoute(settings));
  }

  static Widget _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigation.route:
        return const AppNavigation();
      case SendVerificationCodePage.route:
        return SendVerificationCodePage(pageModel: settings.arguments as SendVerificationCodePageModel);
      case SignInWithVerificationCodePage.route:
        return SignInWithVerificationCodePage(pageModel: settings.arguments as SignInWithVerificationCodePageModel);
      case ChangePasswordPage.route:
        return const ChangePasswordPage();
      case AccountUpdatePage.route:
        return const AccountUpdatePage();
      case BecomeAPartnerPage.route:
        return const BecomeAPartnerPage();
      case SignUpPage.route:
        return const SignUpPage();
      default:
        return const AppNavigation();
    }
  }
}
