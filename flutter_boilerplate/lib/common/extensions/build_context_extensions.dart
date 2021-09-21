import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/_all.dart';
import 'package:flutter_boilerplate/common/localization/localizer.dart';
import 'package:url_launcher/url_launcher.dart';

extension BuildContextExtensions on BuildContext {
  Localizer get localizer => Localizer.of(this);
  TranslationModel get translations => localizer.translations;
  Configuration get configuration => configurationBloc.state.configuration;

  ThemeData get theme => Theme.of(this);
  AppThemeData get appTheme => AppTheme.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  NavigatorState get navigator => Navigator.of(this);
  void popTimes([int number = 1]) => navigator.popTimes(number);
  void pop<T>([T? result]) => navigator.pop();
  void popUntilLast<T>([T? result]) {
    while (navigator.canPop()) {
      navigator.pop();
    }
  }

  Future popUntilLastAndPushPage(Widget page) {
    popUntilLast();
    return pushPage(page);
  }

  void popUntilEnd<T>([T? result]) => navigator.popUntilEnd();
  Future pushPage(Widget page) {
    unfocus();

    if (appSettings.providesOfflineMode) {
      return navigator.push(MaterialPageRoute(builder: (_) => page));
    } else {
      return navigator.push(MaterialPageRoute(builder: (_) => OnlyNetworkPageWrapper(page: page)));
    }
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  ServiceProvider get serviceProvider => RepositoryProvider.of<ServiceProvider>(this);
  AppSettings get appSettings => serviceProvider.appSettings;
  T validator<T>() => RepositoryProvider.of<T>(this);

  void unfocus() => FocusScope.of(this).unfocus();

  Future launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
