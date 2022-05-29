// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_company_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountCompanyResponseModel _$AccountCompanyResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AccountCompanyResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AccountCompanyResponseModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  set photoUrl(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCompanyResponseModelCopyWith<AccountCompanyResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCompanyResponseModelCopyWith<$Res> {
  factory $AccountCompanyResponseModelCopyWith(
          AccountCompanyResponseModel value,
          $Res Function(AccountCompanyResponseModel) then) =
      _$AccountCompanyResponseModelCopyWithImpl<$Res>;
  $Res call({int? id, String? name, String? photoUrl});
}

/// @nodoc
class _$AccountCompanyResponseModelCopyWithImpl<$Res>
    implements $AccountCompanyResponseModelCopyWith<$Res> {
  _$AccountCompanyResponseModelCopyWithImpl(this._value, this._then);

  final AccountCompanyResponseModel _value;
  // ignore: unused_field
  final $Res Function(AccountCompanyResponseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountCompanyResponseModelCopyWith<$Res>
    implements $AccountCompanyResponseModelCopyWith<$Res> {
  factory _$$_AccountCompanyResponseModelCopyWith(
          _$_AccountCompanyResponseModel value,
          $Res Function(_$_AccountCompanyResponseModel) then) =
      __$$_AccountCompanyResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, String? photoUrl});
}

/// @nodoc
class __$$_AccountCompanyResponseModelCopyWithImpl<$Res>
    extends _$AccountCompanyResponseModelCopyWithImpl<$Res>
    implements _$$_AccountCompanyResponseModelCopyWith<$Res> {
  __$$_AccountCompanyResponseModelCopyWithImpl(
      _$_AccountCompanyResponseModel _value,
      $Res Function(_$_AccountCompanyResponseModel) _then)
      : super(_value, (v) => _then(v as _$_AccountCompanyResponseModel));

  @override
  _$_AccountCompanyResponseModel get _value =>
      super._value as _$_AccountCompanyResponseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$_AccountCompanyResponseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountCompanyResponseModel implements _AccountCompanyResponseModel {
  _$_AccountCompanyResponseModel({this.id, this.name, this.photoUrl});

  factory _$_AccountCompanyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountCompanyResponseModelFromJson(json);

  @override
  int? id;
  @override
  String? name;
  @override
  String? photoUrl;

  @override
  String toString() {
    return 'AccountCompanyResponseModel(id: $id, name: $name, photoUrl: $photoUrl)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AccountCompanyResponseModelCopyWith<_$_AccountCompanyResponseModel>
      get copyWith => __$$_AccountCompanyResponseModelCopyWithImpl<
          _$_AccountCompanyResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountCompanyResponseModelToJson(this);
  }
}

abstract class _AccountCompanyResponseModel
    implements AccountCompanyResponseModel {
  factory _AccountCompanyResponseModel(
      {int? id,
      String? name,
      String? photoUrl}) = _$_AccountCompanyResponseModel;

  factory _AccountCompanyResponseModel.fromJson(Map<String, dynamic> json) =
      _$_AccountCompanyResponseModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCompanyResponseModelCopyWith<_$_AccountCompanyResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
