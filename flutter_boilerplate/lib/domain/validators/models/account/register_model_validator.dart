import 'package:flutter_boilerplate/_all.dart';

class RegisterModelValidator extends ModelValidator<RegisterModel> {
  final Localizer localizer;

  RegisterModelValidator({
    required this.localizer,
  });

  String? email(RegisterModel model) => !model.email.hasValue ? localizer.translations.fieldIsRequired : null;
  String? firstName(RegisterModel model) => !model.firstName.hasValue ? localizer.translations.fieldIsRequired : null;
  String? lastName(RegisterModel model) => !model.lastName.hasValue ? localizer.translations.fieldIsRequired : null;
  String? password(RegisterModel model) {
    if (!model.password.hasValue) {
      return localizer.translations.fieldIsRequired;
    }
    if (model.password!.length < 6) {
      return localizer.translations.passwordMustBeAtLeast6Chars;
    }
    return null;
  }

  String? passwordConfirmation(RegisterModel model) {
    if (!model.passwordConfirmation.hasValue) {
      return localizer.translations.fieldIsRequired;
    }

    if (model.password.hasValue && model.password != model.passwordConfirmation) {
      return localizer.translations.passwordsDoNotMatch;
    }

    return null;
  }

  @override
  bool validate(RegisterModel model) {
    return ![
      email(model),
      firstName(model),
      lastName(model),
      password(model),
      passwordConfirmation(model),
    ].any((x) => x != null);
  }
}
