import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request_model.freezed.dart';
part 'change_password_request_model.g.dart';

@unfreezed
class ChangePasswordRequestModel with _$ChangePasswordRequestModel {
  factory ChangePasswordRequestModel({
    String? password,
  }) = _ChangePasswordRequestModel;

  factory ChangePasswordRequestModel.fromJson(Map<String, Object?> json) => _$ChangePasswordRequestModelFromJson(json);
}
