// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountResponseModel _$$_AccountResponseModelFromJson(Map json) =>
    _$_AccountResponseModel(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      timezoneId: json['timezoneId'] as String?,
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      passwordSetByUser: json['passwordSetByUser'] as bool?,
      externalUsers: (json['externalUsers'] as List<dynamic>?)
          ?.map((e) => AccountExternalUserResponseModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_AccountResponseModelToJson(
        _$_AccountResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.photoUrl,
      'timezoneId': instance.timezoneId,
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'passwordSetByUser': instance.passwordSetByUser,
      'externalUsers': instance.externalUsers?.map((e) => e.toJson()).toList(),
    };

const _$AccountTypeEnumMap = {
  AccountType.client: 'client',
  AccountType.partner: 'partner',
  AccountType.administrator: 'administrator',
};
