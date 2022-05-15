import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request_model.freezed.dart';
part 'sign_in_request_model.g.dart';

@unfreezed
class SignInRequestModel with _$SignInRequestModel {
  factory SignInRequestModel({
    String? userName,
    String? password,
  }) = _SignInRequestModel;

  factory SignInRequestModel.fromJson(Map<String, Object?> json) => _$SignInRequestModelFromJson(json);
}
