import 'package:appito/_all.dart';

class SendSMSVerificationCodeRequestModelValidator extends ModelValidator<SendSMSVerificationCodeRequestModel> {
  final AppLocalizations appLocalizations;

  SendSMSVerificationCodeRequestModelValidator({
    required this.appLocalizations,
  });

  String? phoneNumber(SendSMSVerificationCodeRequestModel model) => !model.phoneNumber.hasValue ? appLocalizations.field_is_required : null;

  @override
  bool validate(SendSMSVerificationCodeRequestModel model) => messages(model).isEmpty;

  @override
  List<String> messages(SendSMSVerificationCodeRequestModel model) {
    return [
      phoneNumber(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
