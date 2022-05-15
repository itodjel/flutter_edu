// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInRequestModel _$SignInRequestModelFromJson(Map<String, dynamic> json) {
  return _SignInRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SignInRequestModel {
  String? get userName => throw _privateConstructorUsedError;
  set userName(String? value) => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  set password(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInRequestModelCopyWith<SignInRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRequestModelCopyWith<$Res> {
  factory $SignInRequestModelCopyWith(
          SignInRequestModel value, $Res Function(SignInRequestModel) then) =
      _$SignInRequestModelCopyWithImpl<$Res>;
  $Res call({String? userName, String? password});
}

/// @nodoc
class _$SignInRequestModelCopyWithImpl<$Res>
    implements $SignInRequestModelCopyWith<$Res> {
  _$SignInRequestModelCopyWithImpl(this._value, this._then);

  final SignInRequestModel _value;
  // ignore: unused_field
  final $Res Function(SignInRequestModel) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SignInRequestModelCopyWith<$Res>
    implements $SignInRequestModelCopyWith<$Res> {
  factory _$$_SignInRequestModelCopyWith(_$_SignInRequestModel value,
          $Res Function(_$_SignInRequestModel) then) =
      __$$_SignInRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({String? userName, String? password});
}

/// @nodoc
class __$$_SignInRequestModelCopyWithImpl<$Res>
    extends _$SignInRequestModelCopyWithImpl<$Res>
    implements _$$_SignInRequestModelCopyWith<$Res> {
  __$$_SignInRequestModelCopyWithImpl(
      _$_SignInRequestModel _value, $Res Function(_$_SignInRequestModel) _then)
      : super(_value, (v) => _then(v as _$_SignInRequestModel));

  @override
  _$_SignInRequestModel get _value => super._value as _$_SignInRequestModel;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_SignInRequestModel(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInRequestModel implements _SignInRequestModel {
  _$_SignInRequestModel({this.userName, this.password});

  factory _$_SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignInRequestModelFromJson(json);

  @override
  String? userName;
  @override
  String? password;

  @override
  String toString() {
    return 'SignInRequestModel(userName: $userName, password: $password)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SignInRequestModelCopyWith<_$_SignInRequestModel> get copyWith =>
      __$$_SignInRequestModelCopyWithImpl<_$_SignInRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInRequestModelToJson(this);
  }
}

abstract class _SignInRequestModel implements SignInRequestModel {
  factory _SignInRequestModel({String? userName, String? password}) =
      _$_SignInRequestModel;

  factory _SignInRequestModel.fromJson(Map<String, dynamic> json) =
      _$_SignInRequestModel.fromJson;

  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignInRequestModelCopyWith<_$_SignInRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
