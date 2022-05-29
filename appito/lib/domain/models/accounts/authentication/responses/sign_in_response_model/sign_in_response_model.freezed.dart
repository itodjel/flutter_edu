// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) {
  return _SignInResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SignInResponseModel {
  String? get token => throw _privateConstructorUsedError;
  set token(String? value) => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  set refreshToken(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResponseModelCopyWith<SignInResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseModelCopyWith<$Res> {
  factory $SignInResponseModelCopyWith(
          SignInResponseModel value, $Res Function(SignInResponseModel) then) =
      _$SignInResponseModelCopyWithImpl<$Res>;
  $Res call({String? token, String? refreshToken});
}

/// @nodoc
class _$SignInResponseModelCopyWithImpl<$Res>
    implements $SignInResponseModelCopyWith<$Res> {
  _$SignInResponseModelCopyWithImpl(this._value, this._then);

  final SignInResponseModel _value;
  // ignore: unused_field
  final $Res Function(SignInResponseModel) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SignInResponseModelCopyWith<$Res>
    implements $SignInResponseModelCopyWith<$Res> {
  factory _$$_SignInResponseModelCopyWith(_$_SignInResponseModel value,
          $Res Function(_$_SignInResponseModel) then) =
      __$$_SignInResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({String? token, String? refreshToken});
}

/// @nodoc
class __$$_SignInResponseModelCopyWithImpl<$Res>
    extends _$SignInResponseModelCopyWithImpl<$Res>
    implements _$$_SignInResponseModelCopyWith<$Res> {
  __$$_SignInResponseModelCopyWithImpl(_$_SignInResponseModel _value,
      $Res Function(_$_SignInResponseModel) _then)
      : super(_value, (v) => _then(v as _$_SignInResponseModel));

  @override
  _$_SignInResponseModel get _value => super._value as _$_SignInResponseModel;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_SignInResponseModel(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInResponseModel implements _SignInResponseModel {
  _$_SignInResponseModel({this.token, this.refreshToken});

  factory _$_SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignInResponseModelFromJson(json);

  @override
  String? token;
  @override
  String? refreshToken;

  @override
  String toString() {
    return 'SignInResponseModel(token: $token, refreshToken: $refreshToken)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SignInResponseModelCopyWith<_$_SignInResponseModel> get copyWith =>
      __$$_SignInResponseModelCopyWithImpl<_$_SignInResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInResponseModelToJson(this);
  }
}

abstract class _SignInResponseModel implements SignInResponseModel {
  factory _SignInResponseModel({String? token, String? refreshToken}) =
      _$_SignInResponseModel;

  factory _SignInResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SignInResponseModel.fromJson;

  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  String? get refreshToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignInResponseModelCopyWith<_$_SignInResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
