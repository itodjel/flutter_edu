import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_company_response_model.freezed.dart';
part 'account_company_response_model.g.dart';

@unfreezed
class AccountCompanyResponseModel with _$AccountCompanyResponseModel {
  factory AccountCompanyResponseModel({
    int? id,
    String? name,
    String? photoUrl,
  }) = _AccountCompanyResponseModel;

  factory AccountCompanyResponseModel.fromJson(Map<String, dynamic> json) => _$AccountCompanyResponseModelFromJson(json);
}
