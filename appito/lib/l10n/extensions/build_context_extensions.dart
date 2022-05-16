import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension L10nBuildContextX on BuildContext {
  AppLocalizations get translations => AppLocalizations.of(this)!;
}
