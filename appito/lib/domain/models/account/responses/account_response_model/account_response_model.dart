import 'package:appito/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_response_model.freezed.dart';
part 'account_response_model.g.dart';

@unfreezed
class AccountResponseModel with _$AccountResponseModel {
  factory AccountResponseModel({
    String? id,
    String? firstName,
    String? lastName,
    String? photoUrl,
    String? timezoneId,
    AccountType? accountType,
    bool? passwordSetByUser,
  }) = _AccountResponseModel;

  factory AccountResponseModel.fromJson(Map<String, dynamic> json) => _$AccountResponseModelFromJson(json);
}
