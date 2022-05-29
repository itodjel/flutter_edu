// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) {
  return _SignUpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpRequestModel {
  AccountType? get accountType => throw _privateConstructorUsedError;
  set accountType(AccountType? value) => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  set firstName(String? value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  set userName(String? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  set password(String? value) => throw _privateConstructorUsedError;
  String? get passwordConfirmed => throw _privateConstructorUsedError;
  set passwordConfirmed(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpRequestModelCopyWith<SignUpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestModelCopyWith<$Res> {
  factory $SignUpRequestModelCopyWith(
          SignUpRequestModel value, $Res Function(SignUpRequestModel) then) =
      _$SignUpRequestModelCopyWithImpl<$Res>;
  $Res call(
      {AccountType? accountType,
      String? firstName,
      String? lastName,
      String? userName,
      String? email,
      String? password,
      String? passwordConfirmed});
}

/// @nodoc
class _$SignUpRequestModelCopyWithImpl<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  _$SignUpRequestModelCopyWithImpl(this._value, this._then);

  final SignUpRequestModel _value;
  // ignore: unused_field
  final $Res Function(SignUpRequestModel) _then;

  @override
  $Res call({
    Object? accountType = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? passwordConfirmed = freezed,
  }) {
    return _then(_value.copyWith(
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmed: passwordConfirmed == freezed
          ? _value.passwordConfirmed
          : passwordConfirmed // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpRequestModelCopyWith<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  factory _$$_SignUpRequestModelCopyWith(_$_SignUpRequestModel value,
          $Res Function(_$_SignUpRequestModel) then) =
      __$$_SignUpRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {AccountType? accountType,
      String? firstName,
      String? lastName,
      String? userName,
      String? email,
      String? password,
      String? passwordConfirmed});
}

/// @nodoc
class __$$_SignUpRequestModelCopyWithImpl<$Res>
    extends _$SignUpRequestModelCopyWithImpl<$Res>
    implements _$$_SignUpRequestModelCopyWith<$Res> {
  __$$_SignUpRequestModelCopyWithImpl(
      _$_SignUpRequestModel _value, $Res Function(_$_SignUpRequestModel) _then)
      : super(_value, (v) => _then(v as _$_SignUpRequestModel));

  @override
  _$_SignUpRequestModel get _value => super._value as _$_SignUpRequestModel;

  @override
  $Res call({
    Object? accountType = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? passwordConfirmed = freezed,
  }) {
    return _then(_$_SignUpRequestModel(
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmed: passwordConfirmed == freezed
          ? _value.passwordConfirmed
          : passwordConfirmed // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpRequestModel implements _SignUpRequestModel {
  _$_SignUpRequestModel(
      {this.accountType,
      this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.password,
      this.passwordConfirmed});

  factory _$_SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpRequestModelFromJson(json);

  @override
  AccountType? accountType;
  @override
  String? firstName;
  @override
  String? lastName;
  @override
  String? userName;
  @override
  String? email;
  @override
  String? password;
  @override
  String? passwordConfirmed;

  @override
  String toString() {
    return 'SignUpRequestModel(accountType: $accountType, firstName: $firstName, lastName: $lastName, userName: $userName, email: $email, password: $password, passwordConfirmed: $passwordConfirmed)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SignUpRequestModelCopyWith<_$_SignUpRequestModel> get copyWith =>
      __$$_SignUpRequestModelCopyWithImpl<_$_SignUpRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpRequestModelToJson(this);
  }
}

abstract class _SignUpRequestModel implements SignUpRequestModel {
  factory _SignUpRequestModel(
      {AccountType? accountType,
      String? firstName,
      String? lastName,
      String? userName,
      String? email,
      String? password,
      String? passwordConfirmed}) = _$_SignUpRequestModel;

  factory _SignUpRequestModel.fromJson(Map<String, dynamic> json) =
      _$_SignUpRequestModel.fromJson;

  @override
  AccountType? get accountType => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  String? get passwordConfirmed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpRequestModelCopyWith<_$_SignUpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
