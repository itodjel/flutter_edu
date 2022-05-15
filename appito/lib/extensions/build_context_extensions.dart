import 'package:appito/_all.dart';

extension AppBuildContextExtensions on BuildContext {
  AppLocalizations get translations => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
