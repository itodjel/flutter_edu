// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_update_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountUpdateRequestModel _$AccountUpdateRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AccountUpdateRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AccountUpdateRequestModel {
  String? get firstName => throw _privateConstructorUsedError;
  set firstName(String? value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  set userName(String? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountUpdateRequestModelCopyWith<AccountUpdateRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountUpdateRequestModelCopyWith<$Res> {
  factory $AccountUpdateRequestModelCopyWith(AccountUpdateRequestModel value,
          $Res Function(AccountUpdateRequestModel) then) =
      _$AccountUpdateRequestModelCopyWithImpl<$Res>;
  $Res call(
      {String? firstName, String? lastName, String? userName, String? email});
}

/// @nodoc
class _$AccountUpdateRequestModelCopyWithImpl<$Res>
    implements $AccountUpdateRequestModelCopyWith<$Res> {
  _$AccountUpdateRequestModelCopyWithImpl(this._value, this._then);

  final AccountUpdateRequestModel _value;
  // ignore: unused_field
  final $Res Function(AccountUpdateRequestModel) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
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
    ));
  }
}

/// @nodoc
abstract class _$$_AccountUpdateRequestModelCopyWith<$Res>
    implements $AccountUpdateRequestModelCopyWith<$Res> {
  factory _$$_AccountUpdateRequestModelCopyWith(
          _$_AccountUpdateRequestModel value,
          $Res Function(_$_AccountUpdateRequestModel) then) =
      __$$_AccountUpdateRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? firstName, String? lastName, String? userName, String? email});
}

/// @nodoc
class __$$_AccountUpdateRequestModelCopyWithImpl<$Res>
    extends _$AccountUpdateRequestModelCopyWithImpl<$Res>
    implements _$$_AccountUpdateRequestModelCopyWith<$Res> {
  __$$_AccountUpdateRequestModelCopyWithImpl(
      _$_AccountUpdateRequestModel _value,
      $Res Function(_$_AccountUpdateRequestModel) _then)
      : super(_value, (v) => _then(v as _$_AccountUpdateRequestModel));

  @override
  _$_AccountUpdateRequestModel get _value =>
      super._value as _$_AccountUpdateRequestModel;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_AccountUpdateRequestModel(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountUpdateRequestModel implements _AccountUpdateRequestModel {
  _$_AccountUpdateRequestModel(
      {this.firstName, this.lastName, this.userName, this.email});

  factory _$_AccountUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountUpdateRequestModelFromJson(json);

  @override
  String? firstName;
  @override
  String? lastName;
  @override
  String? userName;
  @override
  String? email;

  @override
  String toString() {
    return 'AccountUpdateRequestModel(firstName: $firstName, lastName: $lastName, userName: $userName, email: $email)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AccountUpdateRequestModelCopyWith<_$_AccountUpdateRequestModel>
      get copyWith => __$$_AccountUpdateRequestModelCopyWithImpl<
          _$_AccountUpdateRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountUpdateRequestModelToJson(this);
  }
}

abstract class _AccountUpdateRequestModel implements AccountUpdateRequestModel {
  factory _AccountUpdateRequestModel(
      {String? firstName,
      String? lastName,
      String? userName,
      String? email}) = _$_AccountUpdateRequestModel;

  factory _AccountUpdateRequestModel.fromJson(Map<String, dynamic> json) =
      _$_AccountUpdateRequestModel.fromJson;

  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountUpdateRequestModelCopyWith<_$_AccountUpdateRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
