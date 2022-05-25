import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_sms_verification_code_request_model.freezed.dart';
part 'send_sms_verification_code_request_model.g.dart';

@unfreezed
class SendSMSVerificationCodeRequestModel with _$SendSMSVerificationCodeRequestModel {
  factory SendSMSVerificationCodeRequestModel({
    String? phoneNumber,
  }) = _SendSMSVerificationCodeRequestModel;

  factory SendSMSVerificationCodeRequestModel.fromJson(Map<String, Object?> json) => _$SendSMSVerificationCodeRequestModelFromJson(json);
}
