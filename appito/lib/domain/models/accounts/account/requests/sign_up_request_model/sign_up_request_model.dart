import 'package:appito/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_model.freezed.dart';
part 'sign_up_request_model.g.dart';

@unfreezed
class SignUpRequestModel with _$SignUpRequestModel {
  factory SignUpRequestModel({
    AccountType? accountType,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? password,
    String? passwordConfirmed,
  }) = _SignUpRequestModel;

  factory SignUpRequestModel.fromJson(Map<String, Object?> json) => _$SignUpRequestModelFromJson(json);
}
