import 'package:appito/_all.dart';

class SendVerificationCodeRequestModelValidator extends ModelValidator {
  final AppLocalizations appLocalizations;
  final EmailPropertyValidator emailPropertyValidator;

  SendVerificationCodeRequestModelValidator({
    required this.appLocalizations,
    required this.emailPropertyValidator,
  });

  String? source(SendVerificationCodeRequestModel model) {
    switch (model.type) {
      case VerificationCodeSourceType.email:
        return emailPropertyValidator.validate(model.source);
      case VerificationCodeSourceType.phoneNumber:
        return !model.source.hasValue ? appLocalizations.field_is_required : null;
      default:
        return null;
    }
  }

  @override
  bool validate(model) => messages(model).isEmpty;

  @override
  List<String> messages(model) {
    return [
      source(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
