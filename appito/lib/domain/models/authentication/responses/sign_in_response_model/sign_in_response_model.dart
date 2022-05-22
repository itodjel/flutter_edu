import 'package:appito/domain/enumerations/account_type.dart';
import 'package:appito/domain/models/account/responses/account_response_model/account_response_model.dart';
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
