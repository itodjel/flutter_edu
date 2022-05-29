// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountResponseModel _$$_AccountResponseModelFromJson(Map json) =>
    _$_AccountResponseModel(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      timezoneId: json['timezoneId'] as String?,
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      profilePhoto: json['profilePhoto'] == null
          ? null
          : MultimediaResponseModel.fromJson(
              Map<String, dynamic>.from(json['profilePhoto'] as Map)),
      currentCompany: json['currentCompany'] == null
          ? null
          : AccountCompanyResponseModel.fromJson(
              Map<String, dynamic>.from(json['currentCompany'] as Map)),
      externalUsers: (json['externalUsers'] as List<dynamic>?)
          ?.map((e) => AccountExternalUserResponseModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => AccountEmployeeResponseModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_AccountResponseModelToJson(
        _$_AccountResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.photoUrl,
      'timezoneId': instance.timezoneId,
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'profilePhoto': instance.profilePhoto?.toJson(),
      'currentCompany': instance.currentCompany?.toJson(),
      'externalUsers': instance.externalUsers?.map((e) => e.toJson()).toList(),
      'employees': instance.employees?.map((e) => e.toJson()).toList(),
    };

const _$AccountTypeEnumMap = {
  AccountType.client: 'client',
  AccountType.partner: 'partner',
  AccountType.admin: 'admin',
};
