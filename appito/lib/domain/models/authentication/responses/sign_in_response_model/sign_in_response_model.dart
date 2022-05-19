import 'package:appito/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response_model.freezed.dart';
part 'sign_in_response_model.g.dart';

@unfreezed
class SignInResponseModel with _$SignInResponseModel {
  factory SignInResponseModel({
    AccountType? accountType,
    String? token,
    String? refreshToken,
    AccountResponseModel? account,
  }) = _SignInResponseModel;

  factory SignInResponseModel.fromJson(Map<String, Object?> json) => _$SignInResponseModelFromJson(json);
}
