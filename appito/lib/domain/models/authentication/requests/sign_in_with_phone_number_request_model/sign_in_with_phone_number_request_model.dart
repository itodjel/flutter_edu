import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_with_phone_number_request_model.freezed.dart';
part 'sign_in_with_phone_number_request_model.g.dart';

@unfreezed
class SignInWithPhoneNumberRequestModel with _$SignInWithPhoneNumberRequestModel {
  factory SignInWithPhoneNumberRequestModel({
    String? phoneNumber,
    String? code,
  }) = _SignInWithPhoneNumberRequestModel;

  factory SignInWithPhoneNumberRequestModel.fromJson(Map<String, Object?> json) => _$SignInWithPhoneNumberRequestModelFromJson(json);
}
