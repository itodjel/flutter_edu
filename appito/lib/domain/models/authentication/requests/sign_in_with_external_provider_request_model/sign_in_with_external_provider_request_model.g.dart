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
          accessToken: json['accessToken'] as String?,
        );

Map<String, dynamic> _$$_SignInWithExternalProviderRequestModelToJson(
        _$_SignInWithExternalProviderRequestModel instance) =>
    <String, dynamic>{
      'signInProvider': _$SignInProviderEnumMap[instance.signInProvider],
      'accessToken': instance.accessToken,
    };

const _$SignInProviderEnumMap = {
  SignInProvider.usernameAndPassword: 'usernameAndPassword',
  SignInProvider.google: 'google',
  SignInProvider.facebook: 'facebook',
  SignInProvider.apple: 'apple',
  SignInProvider.phoneNumber: 'phoneNumber',
  SignInProvider.internal: 'internal',
};
