import 'package:appito/_all.dart';

extension AppBuildContextX on BuildContext {
  IPlatformService get platform => services.get<IPlatformService>();
  NavigatorState get navigator => Navigator.of(this);

  void unfocus() => FocusScope.of(this).unfocus();

  Future pushPage(Widget page) {
    unfocus();
    return navigator.push(MaterialPageRoute(builder: (_) => page));
  }

  Future push(String routeName, [dynamic data]) {
    unfocus();
    return navigator.pushNamed(routeName, arguments: data);
  }

  void popUntilRoot() {
    unfocus();
    while (navigator.canPop()) {
      navigator.pop();
    }
  }
}
