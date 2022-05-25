import 'package:appito/_all.dart';

class ModelValidatorsConfiguration {
  static bool configuredValidators = false;

  static void configure(AppLocalizations appLocalizations) {
    if (configuredValidators) {
      return;
    }

    services.registerSingleton(SignInRequestModelValidator(appLocalizations: appLocalizations));
    services.registerSingleton(SendSMSVerificationCodeRequestModelValidator(appLocalizations: appLocalizations));
    services.registerSingleton(SignInWithPhoneNumberRequestModelValidator(appLocalizations: appLocalizations));

    configuredValidators = true;
  }
}
