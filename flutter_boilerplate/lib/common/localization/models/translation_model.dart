class TranslationModel {
  final String applicationName;
  final String networkErrorException;
  final String serverErrorException;
  final String validationError;
  final String thereWasAnError;
  final String emailIsNotValid;
  final String valueMustBeAPositiveNumber;
  final String fieldIsRequired;
  final String permissionRequired;
  final String applicationNeedsPermissionForPhonesStorage;
  final String allowThisPermissionInYourAppSettings;
  final String applicationNeedsPermissionToPerformRequestedOperation;
  final String cancel;
  final String ok;

  const TranslationModel({
    required this.applicationName,
    required this.networkErrorException,
    required this.serverErrorException,
    required this.validationError,
    required this.thereWasAnError,
    required this.emailIsNotValid,
    required this.valueMustBeAPositiveNumber,
    required this.fieldIsRequired,
    required this.permissionRequired,
    required this.applicationNeedsPermissionForPhonesStorage,
    required this.allowThisPermissionInYourAppSettings,
    required this.applicationNeedsPermissionToPerformRequestedOperation,
    required this.cancel,
    required this.ok,
  });
}
