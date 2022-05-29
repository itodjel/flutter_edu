// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_external_provider_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInWithExternalProviderRequestModel
    _$$_SignInWithExternalProviderRequestModelFromJson(Map json) =>
        _$_SignInWithExternalProviderRequestModel(
          signInProvider: $enumDecodeNullable(
              _$SignInProviderEnumMap, json['signInProvider']),
          value: json['value'] as String?,
          code: json['code'] as String?,
        );

Map<String, dynamic> _$$_SignInWithExternalProviderRequestModelToJson(
        _$_SignInWithExternalProviderRequestModel instance) =>
    <String, dynamic>{
      'signInProvider': _$SignInProviderEnumMap[instance.signInProvider],
      'value': instance.value,
      'code': instance.code,
    };

const _$SignInProviderEnumMap = {
  SignInProvider.email: 'email',
  SignInProvider.google: 'google',
  SignInProvider.facebook: 'facebook',
  SignInProvider.apple: 'apple',
  SignInProvider.phoneNumber: 'phoneNumber',
  SignInProvider.internal: 'internal',
};
