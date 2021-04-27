class TranslationModel {
  final String applicationName;
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
