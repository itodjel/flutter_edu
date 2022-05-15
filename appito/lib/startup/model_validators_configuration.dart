import 'package:appito/_all.dart';

class ModelValidatorsConfiguration {
  static bool configuredValidators = false;

  static Future configure(AppLocalizations appLocalizations) async {
    if (configuredValidators) {
      return;
    }

    services.registerSingleton<SignInRequestModelValidator>(SignInRequestModelValidator(appLocalizations: appLocalizations));

    configuredValidators = true;
  }
}
