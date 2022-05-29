import 'package:appito/_all.dart';

class SignInWithExternalProviderRequestModelValidator extends ModelValidator {
  final AppLocalizations appLocalizations;

  SignInWithExternalProviderRequestModelValidator({
    required this.appLocalizations,
  });

  String? value(SignInWithExternalProviderRequestModel model) => [SignInProvider.phoneNumber, SignInProvider.email].contains(model.signInProvider) && !model.value.hasValue ? appLocalizations.field_is_required : null;
  String? code(SignInWithExternalProviderRequestModel model) => [SignInProvider.phoneNumber, SignInProvider.email].contains(model.signInProvider) && !model.code.hasValue ? appLocalizations.field_is_required : null;

  @override
  bool validate(model) => messages(model).isEmpty;

  @override
  List<String> messages(model) {
    return [
      value(model),
      code(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
