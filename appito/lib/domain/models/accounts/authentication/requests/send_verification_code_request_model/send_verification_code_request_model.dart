import 'package:appito/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_verification_code_request_model.freezed.dart';
part 'send_verification_code_request_model.g.dart';

@unfreezed
class SendVerificationCodeRequestModel with _$SendVerificationCodeRequestModel {
  factory SendVerificationCodeRequestModel({
    VerificationCodeSourceType? type,
    String? source,
  }) = _SendVerificationCodeRequestModel;

  factory SendVerificationCodeRequestModel.fromJson(Map<String, Object?> json) => _$SendVerificationCodeRequestModelFromJson(json);
}
