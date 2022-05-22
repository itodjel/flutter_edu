import 'package:appito/_all.dart';

class ModelValidatorsConfiguration {
  static bool configuredValidators = false;

  static void configure(AppLocalizations appLocalizations) {
    if (configuredValidators) {
      return;
    }

    services.registerSingleton<SignInRequestModelValidator>(SignInRequestModelValidator(appLocalizations: appLocalizations));

    configuredValidators = true;
  }
}
