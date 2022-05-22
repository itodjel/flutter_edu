// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_with_external_provider_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInWithExternalProviderRequestModel
    _$SignInWithExternalProviderRequestModelFromJson(
        Map<String, dynamic> json) {
  return _SignInWithExternalProviderRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SignInWithExternalProviderRequestModel {
  SignInProvider? get signInProvider => throw _privateConstructorUsedError;
  set signInProvider(SignInProvider? value) =>
      throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  set accessToken(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInWithExternalProviderRequestModelCopyWith<
          SignInWithExternalProviderRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithExternalProviderRequestModelCopyWith<$Res> {
  factory $SignInWithExternalProviderRequestModelCopyWith(
          SignInWithExternalProviderRequestModel value,
          $Res Function(SignInWithExternalProviderRequestModel) then) =
      _$SignInWithExternalProviderRequestModelCopyWithImpl<$Res>;
  $Res call({SignInProvider? signInProvider, String? accessToken});
}

/// @nodoc
class _$SignInWithExternalProviderRequestModelCopyWithImpl<$Res>
    implements $SignInWithExternalProviderRequestModelCopyWith<$Res> {
  _$SignInWithExternalProviderRequestModelCopyWithImpl(this._value, this._then);

  final SignInWithExternalProviderRequestModel _value;
  // ignore: unused_field
  final $Res Function(SignInWithExternalProviderRequestModel) _then;

  @override
  $Res call({
    Object? signInProvider = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as SignInProvider?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SignInWithExternalProviderRequestModelCopyWith<$Res>
    implements $SignInWithExternalProviderRequestModelCopyWith<$Res> {
  factory _$$_SignInWithExternalProviderRequestModelCopyWith(
          _$_SignInWithExternalProviderRequestModel value,
          $Res Function(_$_SignInWithExternalProviderRequestModel) then) =
      __$$_SignInWithExternalProviderRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({SignInProvider? signInProvider, String? accessToken});
}

/// @nodoc
class __$$_SignInWithExternalProviderRequestModelCopyWithImpl<$Res>
    extends _$SignInWithExternalProviderRequestModelCopyWithImpl<$Res>
    implements _$$_SignInWithExternalProviderRequestModelCopyWith<$Res> {
  __$$_SignInWithExternalProviderRequestModelCopyWithImpl(
      _$_SignInWithExternalProviderRequestModel _value,
      $Res Function(_$_SignInWithExternalProviderRequestModel) _then)
      : super(_value,
            (v) => _then(v as _$_SignInWithExternalProviderRequestModel));

  @override
  _$_SignInWithExternalProviderRequestModel get _value =>
      super._value as _$_SignInWithExternalProviderRequestModel;

  @override
  $Res call({
    Object? signInProvider = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$_SignInWithExternalProviderRequestModel(
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as SignInProvider?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInWithExternalProviderRequestModel
    implements _SignInWithExternalProviderRequestModel {
  _$_SignInWithExternalProviderRequestModel(
      {this.signInProvider, this.accessToken});

  factory _$_SignInWithExternalProviderRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SignInWithExternalProviderRequestModelFromJson(json);

  @override
  SignInProvider? signInProvider;
  @override
  String? accessToken;

  @override
  String toString() {
    return 'SignInWithExternalProviderRequestModel(signInProvider: $signInProvider, accessToken: $accessToken)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SignInWithExternalProviderRequestModelCopyWith<
          _$_SignInWithExternalProviderRequestModel>
      get copyWith => __$$_SignInWithExternalProviderRequestModelCopyWithImpl<
          _$_SignInWithExternalProviderRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInWithExternalProviderRequestModelToJson(this);
  }
}

abstract class _SignInWithExternalProviderRequestModel
    implements SignInWithExternalProviderRequestModel {
  factory _SignInWithExternalProviderRequestModel(
      {SignInProvider? signInProvider,
      String? accessToken}) = _$_SignInWithExternalProviderRequestModel;

  factory _SignInWithExternalProviderRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$_SignInWithExternalProviderRequestModel.fromJson;

  @override
  SignInProvider? get signInProvider => throw _privateConstructorUsedError;
  @override
  String? get accessToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignInWithExternalProviderRequestModelCopyWith<
          _$_SignInWithExternalProviderRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
