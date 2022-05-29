import 'package:appito/_all.dart';

class SignUpRequestModelValidator extends ModelValidator {
  final AppLocalizations appLocalizations;
  final EmailPropertyValidator emailPropertyValidator;

  SignUpRequestModelValidator({
    required this.appLocalizations,
    required this.emailPropertyValidator,
  });

  String? userName(SignUpRequestModel model) => !model.userName.hasValue ? appLocalizations.field_is_required : null;
  String? email(SignUpRequestModel model) => emailPropertyValidator.validate(model.email);
  String? password(SignUpRequestModel model) => !model.password.hasValue ? appLocalizations.field_is_required : null;
  String? passwordConfirmed(SignUpRequestModel model) {
    if (!model.passwordConfirmed.hasValue) {
      return appLocalizations.field_is_required;
    }

    if (model.password.hasValue && model.password != model.passwordConfirmed) {
      return appLocalizations.passwords_do_not_match;
    }

    return null;
  }

  @override
  bool validate(model) => messages(model).isEmpty;

  @override
  List<String> messages(model) {
    return [
      userName(model),
      email(model),
      password(model),
      passwordConfirmed(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
