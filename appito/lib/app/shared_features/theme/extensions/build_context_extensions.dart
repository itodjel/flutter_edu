import 'package:appito/_all.dart';

extension AppThemeBuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
