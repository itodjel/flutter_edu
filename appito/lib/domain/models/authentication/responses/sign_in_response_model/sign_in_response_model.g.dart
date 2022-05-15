// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInResponseModel _$$_SignInResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SignInResponseModel(
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$_SignInResponseModelToJson(
        _$_SignInResponseModel instance) =>
    <String, dynamic>{
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

const _$AccountTypeEnumMap = {
  AccountType.client: 'client',
  AccountType.partner: 'partner',
  AccountType.administrator: 'administrator',
};
