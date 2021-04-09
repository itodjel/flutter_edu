import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/all.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData theme() => Theme.of(this);
  Localizer localizer() => Localizer.of(this);
  void unfocus() => FocusScope.of(this).unfocus();
  AppThemeData appTheme() => AppTheme.of(this);
  ScaffoldState scaffold() => Scaffold.of(this);
  NavigatorState navigator() => Navigator.of(this);
  MediaQueryData mediaQuery() => MediaQuery.of(this);
  ServiceProvider serviceProvider() => RepositoryProvider.of<ServiceProvider>(this);
  AppSettings appSettings() => RepositoryProvider.of<AppSettings>(this);
  T validator<T>() => RepositoryProvider.of<T>(this);
  void pushPage(Widget page) => this.navigator().push(MaterialPageRoute(builder: (_) => page));
}
