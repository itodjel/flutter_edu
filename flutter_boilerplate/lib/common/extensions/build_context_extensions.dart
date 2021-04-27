import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/all.dart';
import 'package:flutter_boilerplate/common/localization/localizer.dart';

extension BuildContextExtensions on BuildContext {
  Localizer get localizer => Localizer.of(this);
  TranslationModel get translations => localizer.translations;

  ThemeData get theme => Theme.of(this);
  AppThemeData get appTheme => AppTheme.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  NavigatorState get navigator => Navigator.of(this);
  void pop() => navigator.pop();
  void pushPage(Widget page) => navigator.push(MaterialPageRoute(builder: (_) => page));

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  AppSettings get appSettings => RepositoryProvider.of<AppSettings>(this);
  ServiceProvider get serviceProvider => RepositoryProvider.of<ServiceProvider>(this);
  T validator<T>() => RepositoryProvider.of<T>(this);

  void unfocus() => FocusScope.of(this).unfocus();
}
