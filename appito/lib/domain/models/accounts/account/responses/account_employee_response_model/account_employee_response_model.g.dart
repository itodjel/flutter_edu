// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_employee_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountEmployeeResponseModel _$$_AccountEmployeeResponseModelFromJson(
        Map json) =>
    _$_AccountEmployeeResponseModel(
      id: json['id'] as int?,
      role: json['role'] as String?,
      description: json['description'] as String?,
      yearsOfExperience: json['yearsOfExperience'] as int?,
      isPublic: json['isPublic'] as bool?,
      company: json['company'] == null
          ? null
          : AccountCompanyResponseModel.fromJson(
              Map<String, dynamic>.from(json['company'] as Map)),
    );

Map<String, dynamic> _$$_AccountEmployeeResponseModelToJson(
        _$_AccountEmployeeResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'description': instance.description,
      'yearsOfExperience': instance.yearsOfExperience,
      'isPublic': instance.isPublic,
      'company': instance.company?.toJson(),
    };
