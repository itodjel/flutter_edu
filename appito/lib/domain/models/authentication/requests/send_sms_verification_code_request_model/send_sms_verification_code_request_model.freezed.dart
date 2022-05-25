// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'send_sms_verification_code_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendSMSVerificationCodeRequestModel
    _$SendSMSVerificationCodeRequestModelFromJson(Map<String, dynamic> json) {
  return _SendSMSVerificationCodeRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendSMSVerificationCodeRequestModel {
  String? get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendSMSVerificationCodeRequestModelCopyWith<
          SendSMSVerificationCodeRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendSMSVerificationCodeRequestModelCopyWith<$Res> {
  factory $SendSMSVerificationCodeRequestModelCopyWith(
          SendSMSVerificationCodeRequestModel value,
          $Res Function(SendSMSVerificationCodeRequestModel) then) =
      _$SendSMSVerificationCodeRequestModelCopyWithImpl<$Res>;
  $Res call({String? phoneNumber});
}

/// @nodoc
class _$SendSMSVerificationCodeRequestModelCopyWithImpl<$Res>
    implements $SendSMSVerificationCodeRequestModelCopyWith<$Res> {
  _$SendSMSVerificationCodeRequestModelCopyWithImpl(this._value, this._then);

  final SendSMSVerificationCodeRequestModel _value;
  // ignore: unused_field
  final $Res Function(SendSMSVerificationCodeRequestModel) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SendSMSVerificationCodeRequestModelCopyWith<$Res>
    implements $SendSMSVerificationCodeRequestModelCopyWith<$Res> {
  factory _$$_SendSMSVerificationCodeRequestModelCopyWith(
          _$_SendSMSVerificationCodeRequestModel value,
          $Res Function(_$_SendSMSVerificationCodeRequestModel) then) =
      __$$_SendSMSVerificationCodeRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({String? phoneNumber});
}

/// @nodoc
class __$$_SendSMSVerificationCodeRequestModelCopyWithImpl<$Res>
    extends _$SendSMSVerificationCodeRequestModelCopyWithImpl<$Res>
    implements _$$_SendSMSVerificationCodeRequestModelCopyWith<$Res> {
  __$$_SendSMSVerificationCodeRequestModelCopyWithImpl(
      _$_SendSMSVerificationCodeRequestModel _value,
      $Res Function(_$_SendSMSVerificationCodeRequestModel) _then)
      : super(
            _value, (v) => _then(v as _$_SendSMSVerificationCodeRequestModel));

  @override
  _$_SendSMSVerificationCodeRequestModel get _value =>
      super._value as _$_SendSMSVerificationCodeRequestModel;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_SendSMSVerificationCodeRequestModel(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendSMSVerificationCodeRequestModel
    implements _SendSMSVerificationCodeRequestModel {
  _$_SendSMSVerificationCodeRequestModel({this.phoneNumber});

  factory _$_SendSMSVerificationCodeRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SendSMSVerificationCodeRequestModelFromJson(json);

  @override
  String? phoneNumber;

  @override
  String toString() {
    return 'SendSMSVerificationCodeRequestModel(phoneNumber: $phoneNumber)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SendSMSVerificationCodeRequestModelCopyWith<
          _$_SendSMSVerificationCodeRequestModel>
      get copyWith => __$$_SendSMSVerificationCodeRequestModelCopyWithImpl<
          _$_SendSMSVerificationCodeRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendSMSVerificationCodeRequestModelToJson(this);
  }
}

abstract class _SendSMSVerificationCodeRequestModel
    implements SendSMSVerificationCodeRequestModel {
  factory _SendSMSVerificationCodeRequestModel({String? phoneNumber}) =
      _$_SendSMSVerificationCodeRequestModel;

  factory _SendSMSVerificationCodeRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$_SendSMSVerificationCodeRequestModel.fromJson;

  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SendSMSVerificationCodeRequestModelCopyWith<
          _$_SendSMSVerificationCodeRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
