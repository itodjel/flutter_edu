// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_external_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountExternalUserResponseModel
    _$$_AccountExternalUserResponseModelFromJson(Map json) =>
        _$_AccountExternalUserResponseModel(
          id: json['id'] as int?,
          signInProvider: $enumDecodeNullable(
              _$SignInProviderEnumMap, json['signInProvider']),
          phoneNumber: json['phoneNumber'] as String?,
        );

Map<String, dynamic> _$$_AccountExternalUserResponseModelToJson(
        _$_AccountExternalUserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'signInProvider': _$SignInProviderEnumMap[instance.signInProvider],
      'phoneNumber': instance.phoneNumber,
    };

const _$SignInProviderEnumMap = {
  SignInProvider.usernameAndPassword: 'usernameAndPassword',
  SignInProvider.google: 'google',
  SignInProvider.facebook: 'facebook',
  SignInProvider.apple: 'apple',
  SignInProvider.phoneNumber: 'phoneNumber',
  SignInProvider.internal: 'internal',
};
