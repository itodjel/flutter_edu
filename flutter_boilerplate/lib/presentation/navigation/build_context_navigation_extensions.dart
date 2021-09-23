import 'package:flutter_boilerplate/_all.dart';

extension BuildContextNavigationExtensions on BuildContext {
  Future<T?> pushLoginPage<T>() => navigator.pushNamed(LoginPage.route);
}
