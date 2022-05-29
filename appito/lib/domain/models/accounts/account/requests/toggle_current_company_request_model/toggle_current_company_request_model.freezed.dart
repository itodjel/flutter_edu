// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'toggle_current_company_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToggleCurrentCompanyRequestModel _$ToggleCurrentCompanyRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ToggleCurrentCompanyRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ToggleCurrentCompanyRequestModel {
  int? get companyId => throw _privateConstructorUsedError;
  set companyId(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToggleCurrentCompanyRequestModelCopyWith<ToggleCurrentCompanyRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleCurrentCompanyRequestModelCopyWith<$Res> {
  factory $ToggleCurrentCompanyRequestModelCopyWith(
          ToggleCurrentCompanyRequestModel value,
          $Res Function(ToggleCurrentCompanyRequestModel) then) =
      _$ToggleCurrentCompanyRequestModelCopyWithImpl<$Res>;
  $Res call({int? companyId});
}

/// @nodoc
class _$ToggleCurrentCompanyRequestModelCopyWithImpl<$Res>
    implements $ToggleCurrentCompanyRequestModelCopyWith<$Res> {
  _$ToggleCurrentCompanyRequestModelCopyWithImpl(this._value, this._then);

  final ToggleCurrentCompanyRequestModel _value;
  // ignore: unused_field
  final $Res Function(ToggleCurrentCompanyRequestModel) _then;

  @override
  $Res call({
    Object? companyId = freezed,
  }) {
    return _then(_value.copyWith(
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ToggleCurrentCompanyRequestModelCopyWith<$Res>
    implements $ToggleCurrentCompanyRequestModelCopyWith<$Res> {
  factory _$$_ToggleCurrentCompanyRequestModelCopyWith(
          _$_ToggleCurrentCompanyRequestModel value,
          $Res Function(_$_ToggleCurrentCompanyRequestModel) then) =
      __$$_ToggleCurrentCompanyRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({int? companyId});
}

/// @nodoc
class __$$_ToggleCurrentCompanyRequestModelCopyWithImpl<$Res>
    extends _$ToggleCurrentCompanyRequestModelCopyWithImpl<$Res>
    implements _$$_ToggleCurrentCompanyRequestModelCopyWith<$Res> {
  __$$_ToggleCurrentCompanyRequestModelCopyWithImpl(
      _$_ToggleCurrentCompanyRequestModel _value,
      $Res Function(_$_ToggleCurrentCompanyRequestModel) _then)
      : super(_value, (v) => _then(v as _$_ToggleCurrentCompanyRequestModel));

  @override
  _$_ToggleCurrentCompanyRequestModel get _value =>
      super._value as _$_ToggleCurrentCompanyRequestModel;

  @override
  $Res call({
    Object? companyId = freezed,
  }) {
    return _then(_$_ToggleCurrentCompanyRequestModel(
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToggleCurrentCompanyRequestModel
    implements _ToggleCurrentCompanyRequestModel {
  _$_ToggleCurrentCompanyRequestModel({this.companyId});

  factory _$_ToggleCurrentCompanyRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_ToggleCurrentCompanyRequestModelFromJson(json);

  @override
  int? companyId;

  @override
  String toString() {
    return 'ToggleCurrentCompanyRequestModel(companyId: $companyId)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ToggleCurrentCompanyRequestModelCopyWith<
          _$_ToggleCurrentCompanyRequestModel>
      get copyWith => __$$_ToggleCurrentCompanyRequestModelCopyWithImpl<
          _$_ToggleCurrentCompanyRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToggleCurrentCompanyRequestModelToJson(this);
  }
}

abstract class _ToggleCurrentCompanyRequestModel
    implements ToggleCurrentCompanyRequestModel {
  factory _ToggleCurrentCompanyRequestModel({int? companyId}) =
      _$_ToggleCurrentCompanyRequestModel;

  factory _ToggleCurrentCompanyRequestModel.fromJson(
      Map<String, dynamic> json) = _$_ToggleCurrentCompanyRequestModel.fromJson;

  @override
  int? get companyId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ToggleCurrentCompanyRequestModelCopyWith<
          _$_ToggleCurrentCompanyRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
