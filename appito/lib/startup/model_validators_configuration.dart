import 'package:appito/_all.dart';

class ModelValidatorsConfiguration {
  static bool configuredValidators = false;

  static void configure(AppLocalizations appLocalizations) {
    if (configuredValidators) {
      return;
    }

    services.registerSingleton(SignInRequestModelValidator(appLocalizations: appLocalizations));
    services.registerSingleton(
      SendVerificationCodeRequestModelValidator(
        appLocalizations: appLocalizations,
        emailPropertyValidator: EmailPropertyValidator.required(appLocalizations: appLocalizations),
      ),
    );
    services.registerSingleton(SignInWithExternalProviderRequestModelValidator(appLocalizations: appLocalizations));
    services.registerSingleton(ChangePasswordRequestModelValidator(appLocalizations: appLocalizations));
    services.registerSingleton(AccountUpdateRequestModelValidator(appLocalizations: appLocalizations));

    configuredValidators = true;
  }
}
