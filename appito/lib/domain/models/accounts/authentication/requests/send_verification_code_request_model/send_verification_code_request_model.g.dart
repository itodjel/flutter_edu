// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_verification_code_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendVerificationCodeRequestModel
    _$$_SendVerificationCodeRequestModelFromJson(Map json) =>
        _$_SendVerificationCodeRequestModel(
          type: $enumDecodeNullable(
              _$VerificationCodeSourceTypeEnumMap, json['type']),
          source: json['source'] as String?,
        );

Map<String, dynamic> _$$_SendVerificationCodeRequestModelToJson(
        _$_SendVerificationCodeRequestModel instance) =>
    <String, dynamic>{
      'type': _$VerificationCodeSourceTypeEnumMap[instance.type],
      'source': instance.source,
    };

const _$VerificationCodeSourceTypeEnumMap = {
  VerificationCodeSourceType.email: 'email',
  VerificationCodeSourceType.phoneNumber: 'phoneNumber',
};
