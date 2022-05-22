// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_external_user_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountExternalUserResponseModel _$AccountExternalUserResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AccountExternalUserResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AccountExternalUserResponseModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  SignInProvider? get signInProvider => throw _privateConstructorUsedError;
  set signInProvider(SignInProvider? value) =>
      throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountExternalUserResponseModelCopyWith<AccountExternalUserResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountExternalUserResponseModelCopyWith<$Res> {
  factory $AccountExternalUserResponseModelCopyWith(
          AccountExternalUserResponseModel value,
          $Res Function(AccountExternalUserResponseModel) then) =
      _$AccountExternalUserResponseModelCopyWithImpl<$Res>;
  $Res call({int? id, SignInProvider? signInProvider, String? phoneNumber});
}

/// @nodoc
class _$AccountExternalUserResponseModelCopyWithImpl<$Res>
    implements $AccountExternalUserResponseModelCopyWith<$Res> {
  _$AccountExternalUserResponseModelCopyWithImpl(this._value, this._then);

  final AccountExternalUserResponseModel _value;
  // ignore: unused_field
  final $Res Function(AccountExternalUserResponseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? signInProvider = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as SignInProvider?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountExternalUserResponseModelCopyWith<$Res>
    implements $AccountExternalUserResponseModelCopyWith<$Res> {
  factory _$$_AccountExternalUserResponseModelCopyWith(
          _$_AccountExternalUserResponseModel value,
          $Res Function(_$_AccountExternalUserResponseModel) then) =
      __$$_AccountExternalUserResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, SignInProvider? signInProvider, String? phoneNumber});
}

/// @nodoc
class __$$_AccountExternalUserResponseModelCopyWithImpl<$Res>
    extends _$AccountExternalUserResponseModelCopyWithImpl<$Res>
    implements _$$_AccountExternalUserResponseModelCopyWith<$Res> {
  __$$_AccountExternalUserResponseModelCopyWithImpl(
      _$_AccountExternalUserResponseModel _value,
      $Res Function(_$_AccountExternalUserResponseModel) _then)
      : super(_value, (v) => _then(v as _$_AccountExternalUserResponseModel));

  @override
  _$_AccountExternalUserResponseModel get _value =>
      super._value as _$_AccountExternalUserResponseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? signInProvider = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_AccountExternalUserResponseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as SignInProvider?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountExternalUserResponseModel
    implements _AccountExternalUserResponseModel {
  _$_AccountExternalUserResponseModel(
      {this.id, this.signInProvider, this.phoneNumber});

  factory _$_AccountExternalUserResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_AccountExternalUserResponseModelFromJson(json);

  @override
  int? id;
  @override
  SignInProvider? signInProvider;
  @override
  String? phoneNumber;

  @override
  String toString() {
    return 'AccountExternalUserResponseModel(id: $id, signInProvider: $signInProvider, phoneNumber: $phoneNumber)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AccountExternalUserResponseModelCopyWith<
          _$_AccountExternalUserResponseModel>
      get copyWith => __$$_AccountExternalUserResponseModelCopyWithImpl<
          _$_AccountExternalUserResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountExternalUserResponseModelToJson(this);
  }
}

abstract class _AccountExternalUserResponseModel
    implements AccountExternalUserResponseModel {
  factory _AccountExternalUserResponseModel(
      {int? id,
      SignInProvider? signInProvider,
      String? phoneNumber}) = _$_AccountExternalUserResponseModel;

  factory _AccountExternalUserResponseModel.fromJson(
      Map<String, dynamic> json) = _$_AccountExternalUserResponseModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  SignInProvider? get signInProvider => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountExternalUserResponseModelCopyWith<
          _$_AccountExternalUserResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
