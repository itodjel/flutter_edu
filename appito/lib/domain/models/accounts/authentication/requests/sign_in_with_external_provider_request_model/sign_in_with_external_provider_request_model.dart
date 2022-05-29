import 'package:appito/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_with_external_provider_request_model.freezed.dart';
part 'sign_in_with_external_provider_request_model.g.dart';

@unfreezed
class SignInWithExternalProviderRequestModel with _$SignInWithExternalProviderRequestModel {
  factory SignInWithExternalProviderRequestModel({
    SignInProvider? signInProvider,
    String? value,
    String? code,
  }) = _SignInWithExternalProviderRequestModel;

  factory SignInWithExternalProviderRequestModel.fromJson(Map<String, Object?> json) => _$SignInWithExternalProviderRequestModelFromJson(json);
}
