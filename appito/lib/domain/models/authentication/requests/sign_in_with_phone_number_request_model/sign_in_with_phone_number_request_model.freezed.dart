// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_with_phone_number_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInWithPhoneNumberRequestModel _$SignInWithPhoneNumberRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SignInWithPhoneNumberRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SignInWithPhoneNumberRequestModel {
  String? get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String? value) => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  set code(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInWithPhoneNumberRequestModelCopyWith<SignInWithPhoneNumberRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithPhoneNumberRequestModelCopyWith<$Res> {
  factory $SignInWithPhoneNumberRequestModelCopyWith(
          SignInWithPhoneNumberRequestModel value,
          $Res Function(SignInWithPhoneNumberRequestModel) then) =
      _$SignInWithPhoneNumberRequestModelCopyWithImpl<$Res>;
  $Res call({String? phoneNumber, String? code});
}

/// @nodoc
class _$SignInWithPhoneNumberRequestModelCopyWithImpl<$Res>
    implements $SignInWithPhoneNumberRequestModelCopyWith<$Res> {
  _$SignInWithPhoneNumberRequestModelCopyWithImpl(this._value, this._then);

  final SignInWithPhoneNumberRequestModel _value;
  // ignore: unused_field
  final $Res Function(SignInWithPhoneNumberRequestModel) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SignInWithPhoneNumberRequestModelCopyWith<$Res>
    implements $SignInWithPhoneNumberRequestModelCopyWith<$Res> {
  factory _$$_SignInWithPhoneNumberRequestModelCopyWith(
          _$_SignInWithPhoneNumberRequestModel value,
          $Res Function(_$_SignInWithPhoneNumberRequestModel) then) =
      __$$_SignInWithPhoneNumberRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({String? phoneNumber, String? code});
}

/// @nodoc
class __$$_SignInWithPhoneNumberRequestModelCopyWithImpl<$Res>
    extends _$SignInWithPhoneNumberRequestModelCopyWithImpl<$Res>
    implements _$$_SignInWithPhoneNumberRequestModelCopyWith<$Res> {
  __$$_SignInWithPhoneNumberRequestModelCopyWithImpl(
      _$_SignInWithPhoneNumberRequestModel _value,
      $Res Function(_$_SignInWithPhoneNumberRequestModel) _then)
      : super(_value, (v) => _then(v as _$_SignInWithPhoneNumberRequestModel));

  @override
  _$_SignInWithPhoneNumberRequestModel get _value =>
      super._value as _$_SignInWithPhoneNumberRequestModel;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_SignInWithPhoneNumberRequestModel(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInWithPhoneNumberRequestModel
    implements _SignInWithPhoneNumberRequestModel {
  _$_SignInWithPhoneNumberRequestModel({this.phoneNumber, this.code});

  factory _$_SignInWithPhoneNumberRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SignInWithPhoneNumberRequestModelFromJson(json);

  @override
  String? phoneNumber;
  @override
  String? code;

  @override
  String toString() {
    return 'SignInWithPhoneNumberRequestModel(phoneNumber: $phoneNumber, code: $code)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SignInWithPhoneNumberRequestModelCopyWith<
          _$_SignInWithPhoneNumberRequestModel>
      get copyWith => __$$_SignInWithPhoneNumberRequestModelCopyWithImpl<
          _$_SignInWithPhoneNumberRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInWithPhoneNumberRequestModelToJson(this);
  }
}

abstract class _SignInWithPhoneNumberRequestModel
    implements SignInWithPhoneNumberRequestModel {
  factory _SignInWithPhoneNumberRequestModel(
      {String? phoneNumber,
      String? code}) = _$_SignInWithPhoneNumberRequestModel;

  factory _SignInWithPhoneNumberRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$_SignInWithPhoneNumberRequestModel.fromJson;

  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignInWithPhoneNumberRequestModelCopyWith<
          _$_SignInWithPhoneNumberRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
