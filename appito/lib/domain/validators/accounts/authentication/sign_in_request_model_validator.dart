import 'package:appito/_all.dart';

class SignInRequestModelValidator extends ModelValidator {
  final AppLocalizations appLocalizations;

  SignInRequestModelValidator({
    required this.appLocalizations,
  });

  String? userName(SignInRequestModel model) => !model.userName.hasValue ? appLocalizations.field_is_required : null;
  String? password(SignInRequestModel model) => !model.password.hasValue ? appLocalizations.field_is_required : null;

  @override
  bool validate(model) => messages(model).isEmpty;

  @override
  List<String> messages(model) {
    return [
      userName(model),
      password(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
