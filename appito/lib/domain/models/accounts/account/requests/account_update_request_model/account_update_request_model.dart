import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_update_request_model.freezed.dart';
part 'account_update_request_model.g.dart';

@unfreezed
class AccountUpdateRequestModel with _$AccountUpdateRequestModel {
  factory AccountUpdateRequestModel({
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
  }) = _AccountUpdateRequestModel;

  factory AccountUpdateRequestModel.fromJson(Map<String, Object?> json) => _$AccountUpdateRequestModelFromJson(json);
}
