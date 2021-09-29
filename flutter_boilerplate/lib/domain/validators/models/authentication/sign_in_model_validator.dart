import 'package:flutter_boilerplate/_all.dart';

class SignInModelValidator extends ModelValidator<SignInModel> {
  final Localizer localizer;

  SignInModelValidator({
    required this.localizer,
  });

  String? userNameOrEmail(SignInModel model) => !model.userNameOrEmail.hasValue ? localizer.translations.fieldIsRequired : null;
  String? password(SignInModel model) => !model.password.hasValue ? localizer.translations.fieldIsRequired : null;

  @override
  bool validate(SignInModel model) {
    return ![
      userNameOrEmail(model),
      password(model),
    ].any((x) => x != null);
  }
}
