import 'package:flutter_boilerplate/_all.dart';

class ResetPasswordModelValidator extends ModelValidator<ResetPasswordModel> {
  final Localizer localizer;

  ResetPasswordModelValidator({
    required this.localizer,
  });

  String? code(ResetPasswordModel model) => !model.code.hasValue ? localizer.translations.fieldIsRequired : null;

  String? newPassword(ResetPasswordModel model) {
    if (!model.newPassword.hasValue) {
      return localizer.translations.fieldIsRequired;
    }
    return null;
  }

  String? passwordConfirmation(ResetPasswordModel model) {
    if (!model.passwordConfirmation.hasValue) {
      return localizer.translations.fieldIsRequired;
    }
    if (model.passwordConfirmation != model.newPassword) {
      return localizer.translations.passwordsDoNotMatch;
    }
    return null;
  }

  @override
  bool validate(ResetPasswordModel model) {
    return ![
      code(model),
      newPassword(model),
      passwordConfirmation(model),
    ].any((x) => x != null);
  }
}
