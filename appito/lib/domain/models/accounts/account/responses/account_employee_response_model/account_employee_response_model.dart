import 'package:appito/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_employee_response_model.freezed.dart';
part 'account_employee_response_model.g.dart';

@unfreezed
class AccountEmployeeResponseModel with _$AccountEmployeeResponseModel {
  factory AccountEmployeeResponseModel({
    int? id,
    String? role,
    String? description,
    int? yearsOfExperience,
    bool? isPublic,
    AccountCompanyResponseModel? company,
  }) = _AccountEmployeeResponseModel;

  factory AccountEmployeeResponseModel.fromJson(Map<String, dynamic> json) => _$AccountEmployeeResponseModelFromJson(json);
}
