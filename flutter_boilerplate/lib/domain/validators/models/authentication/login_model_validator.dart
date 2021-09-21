import 'package:flutter_boilerplate/_all.dart';

class LoginModelValidator extends ModelValidator<LoginModel> {
  final Localizer localizer;

  LoginModelValidator({
    required this.localizer,
  });

  String? userNameOrEmail(LoginModel model) => !model.userNameOrEmail.hasValue ? localizer.translations.fieldIsRequired : null;
  String? password(LoginModel model) => !model.password.hasValue ? localizer.translations.fieldIsRequired : null;

  @override
  bool validate(LoginModel model) {
    return ![
      userNameOrEmail(model),
      password(model),
    ].any((x) => x != null);
  }
}
