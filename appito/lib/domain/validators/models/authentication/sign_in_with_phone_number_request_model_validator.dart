import 'package:appito/_all.dart';

class SignInWithPhoneNumberRequestModelValidator extends ModelValidator<SignInWithPhoneNumberRequestModel> {
  final AppLocalizations appLocalizations;

  SignInWithPhoneNumberRequestModelValidator({
    required this.appLocalizations,
  });

  String? phoneNumber(SignInWithPhoneNumberRequestModel model) => !model.phoneNumber.hasValue ? appLocalizations.field_is_required : null;
  String? code(SignInWithPhoneNumberRequestModel model) => !model.code.hasValue ? appLocalizations.field_is_required : null;

  @override
  bool validate(SignInWithPhoneNumberRequestModel model) => messages(model).isEmpty;

  @override
  List<String> messages(SignInWithPhoneNumberRequestModel model) {
    return [
      phoneNumber(model),
      code(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
