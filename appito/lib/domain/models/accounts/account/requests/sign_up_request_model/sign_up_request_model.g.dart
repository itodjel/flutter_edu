// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpRequestModel _$$_SignUpRequestModelFromJson(Map json) =>
    _$_SignUpRequestModel(
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirmed: json['passwordConfirmed'] as String?,
    );

Map<String, dynamic> _$$_SignUpRequestModelToJson(
        _$_SignUpRequestModel instance) =>
    <String, dynamic>{
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'passwordConfirmed': instance.passwordConfirmed,
    };

const _$AccountTypeEnumMap = {
  AccountType.client: 'client',
  AccountType.partner: 'partner',
  AccountType.admin: 'admin',
};
