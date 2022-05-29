// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'send_verification_code_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendVerificationCodeRequestModel _$SendVerificationCodeRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SendVerificationCodeRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendVerificationCodeRequestModel {
  VerificationCodeSourceType? get type => throw _privateConstructorUsedError;
  set type(VerificationCodeSourceType? value) =>
      throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  set source(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendVerificationCodeRequestModelCopyWith<SendVerificationCodeRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendVerificationCodeRequestModelCopyWith<$Res> {
  factory $SendVerificationCodeRequestModelCopyWith(
          SendVerificationCodeRequestModel value,
          $Res Function(SendVerificationCodeRequestModel) then) =
      _$SendVerificationCodeRequestModelCopyWithImpl<$Res>;
  $Res call({VerificationCodeSourceType? type, String? source});
}

/// @nodoc
class _$SendVerificationCodeRequestModelCopyWithImpl<$Res>
    implements $SendVerificationCodeRequestModelCopyWith<$Res> {
  _$SendVerificationCodeRequestModelCopyWithImpl(this._value, this._then);

  final SendVerificationCodeRequestModel _value;
  // ignore: unused_field
  final $Res Function(SendVerificationCodeRequestModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VerificationCodeSourceType?,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SendVerificationCodeRequestModelCopyWith<$Res>
    implements $SendVerificationCodeRequestModelCopyWith<$Res> {
  factory _$$_SendVerificationCodeRequestModelCopyWith(
          _$_SendVerificationCodeRequestModel value,
          $Res Function(_$_SendVerificationCodeRequestModel) then) =
      __$$_SendVerificationCodeRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({VerificationCodeSourceType? type, String? source});
}

/// @nodoc
class __$$_SendVerificationCodeRequestModelCopyWithImpl<$Res>
    extends _$SendVerificationCodeRequestModelCopyWithImpl<$Res>
    implements _$$_SendVerificationCodeRequestModelCopyWith<$Res> {
  __$$_SendVerificationCodeRequestModelCopyWithImpl(
      _$_SendVerificationCodeRequestModel _value,
      $Res Function(_$_SendVerificationCodeRequestModel) _then)
      : super(_value, (v) => _then(v as _$_SendVerificationCodeRequestModel));

  @override
  _$_SendVerificationCodeRequestModel get _value =>
      super._value as _$_SendVerificationCodeRequestModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? source = freezed,
  }) {
    return _then(_$_SendVerificationCodeRequestModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VerificationCodeSourceType?,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendVerificationCodeRequestModel
    implements _SendVerificationCodeRequestModel {
  _$_SendVerificationCodeRequestModel({this.type, this.source});

  factory _$_SendVerificationCodeRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SendVerificationCodeRequestModelFromJson(json);

  @override
  VerificationCodeSourceType? type;
  @override
  String? source;

  @override
  String toString() {
    return 'SendVerificationCodeRequestModel(type: $type, source: $source)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SendVerificationCodeRequestModelCopyWith<
          _$_SendVerificationCodeRequestModel>
      get copyWith => __$$_SendVerificationCodeRequestModelCopyWithImpl<
          _$_SendVerificationCodeRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendVerificationCodeRequestModelToJson(this);
  }
}

abstract class _SendVerificationCodeRequestModel
    implements SendVerificationCodeRequestModel {
  factory _SendVerificationCodeRequestModel(
      {VerificationCodeSourceType? type,
      String? source}) = _$_SendVerificationCodeRequestModel;

  factory _SendVerificationCodeRequestModel.fromJson(
      Map<String, dynamic> json) = _$_SendVerificationCodeRequestModel.fromJson;

  @override
  VerificationCodeSourceType? get type => throw _privateConstructorUsedError;
  @override
  String? get source => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SendVerificationCodeRequestModelCopyWith<
          _$_SendVerificationCodeRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
