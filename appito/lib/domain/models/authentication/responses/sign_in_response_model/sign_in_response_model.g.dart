// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInResponseModel _$$_SignInResponseModelFromJson(Map json) =>
    _$_SignInResponseModel(
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      account: json['account'] == null
          ? null
          : AccountResponseModel.fromJson(
              Map<String, dynamic>.from(json['account'] as Map)),
    );

Map<String, dynamic> _$$_SignInResponseModelToJson(
        _$_SignInResponseModel instance) =>
    <String, dynamic>{
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'account': instance.account?.toJson(),
    };

const _$AccountTypeEnumMap = {
  AccountType.client: 'client',
  AccountType.partner: 'partner',
  AccountType.administrator: 'administrator',
};
