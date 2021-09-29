import 'package:flutter_boilerplate/_all.dart';

extension NavigatorStateExtensions on NavigatorState {
  Future<T?> resetAndPushNamed<T>(String route, {Object? arguments}) {
    popUntil((route) => route.settings.name == ApplicationNavigationWrapper.route);
    return pushNamed(SignInPage.route);
  }
}
