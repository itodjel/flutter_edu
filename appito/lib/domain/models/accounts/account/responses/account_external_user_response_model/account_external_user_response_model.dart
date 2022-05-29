import 'package:appito/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_external_user_response_model.freezed.dart';
part 'account_external_user_response_model.g.dart';

@unfreezed
class AccountExternalUserResponseModel with _$AccountExternalUserResponseModel {
  factory AccountExternalUserResponseModel({
    int? id,
    SignInProvider? signInProvider,
    String? phoneNumber,
  }) = _AccountExternalUserResponseModel;

  factory AccountExternalUserResponseModel.fromJson(Map<String, dynamic> json) => _$AccountExternalUserResponseModelFromJson(json);
}
