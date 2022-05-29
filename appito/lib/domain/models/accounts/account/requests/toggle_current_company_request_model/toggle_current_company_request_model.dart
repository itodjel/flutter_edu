import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_current_company_request_model.freezed.dart';
part 'toggle_current_company_request_model.g.dart';

@unfreezed
class ToggleCurrentCompanyRequestModel with _$ToggleCurrentCompanyRequestModel {
  factory ToggleCurrentCompanyRequestModel({
    int? companyId,
  }) = _ToggleCurrentCompanyRequestModel;

  factory ToggleCurrentCompanyRequestModel.fromJson(Map<String, Object?> json) => _$ToggleCurrentCompanyRequestModelFromJson(json);
}
