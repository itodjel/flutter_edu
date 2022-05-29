// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_employee_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountEmployeeResponseModel _$AccountEmployeeResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AccountEmployeeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AccountEmployeeResponseModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  set role(String? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  int? get yearsOfExperience => throw _privateConstructorUsedError;
  set yearsOfExperience(int? value) => throw _privateConstructorUsedError;
  bool? get isPublic => throw _privateConstructorUsedError;
  set isPublic(bool? value) => throw _privateConstructorUsedError;
  AccountCompanyResponseModel? get company =>
      throw _privateConstructorUsedError;
  set company(AccountCompanyResponseModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountEmployeeResponseModelCopyWith<AccountEmployeeResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEmployeeResponseModelCopyWith<$Res> {
  factory $AccountEmployeeResponseModelCopyWith(
          AccountEmployeeResponseModel value,
          $Res Function(AccountEmployeeResponseModel) then) =
      _$AccountEmployeeResponseModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? role,
      String? description,
      int? yearsOfExperience,
      bool? isPublic,
      AccountCompanyResponseModel? company});

  $AccountCompanyResponseModelCopyWith<$Res>? get company;
}

/// @nodoc
class _$AccountEmployeeResponseModelCopyWithImpl<$Res>
    implements $AccountEmployeeResponseModelCopyWith<$Res> {
  _$AccountEmployeeResponseModelCopyWithImpl(this._value, this._then);

  final AccountEmployeeResponseModel _value;
  // ignore: unused_field
  final $Res Function(AccountEmployeeResponseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? description = freezed,
    Object? yearsOfExperience = freezed,
    Object? isPublic = freezed,
    Object? company = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsOfExperience: yearsOfExperience == freezed
          ? _value.yearsOfExperience
          : yearsOfExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as AccountCompanyResponseModel?,
    ));
  }

  @override
  $AccountCompanyResponseModelCopyWith<$Res>? get company {
    if (_value.company == null) {
      return null;
    }

    return $AccountCompanyResponseModelCopyWith<$Res>(_value.company!, (value) {
      return _then(_value.copyWith(company: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountEmployeeResponseModelCopyWith<$Res>
    implements $AccountEmployeeResponseModelCopyWith<$Res> {
  factory _$$_AccountEmployeeResponseModelCopyWith(
          _$_AccountEmployeeResponseModel value,
          $Res Function(_$_AccountEmployeeResponseModel) then) =
      __$$_AccountEmployeeResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? role,
      String? description,
      int? yearsOfExperience,
      bool? isPublic,
      AccountCompanyResponseModel? company});

  @override
  $AccountCompanyResponseModelCopyWith<$Res>? get company;
}

/// @nodoc
class __$$_AccountEmployeeResponseModelCopyWithImpl<$Res>
    extends _$AccountEmployeeResponseModelCopyWithImpl<$Res>
    implements _$$_AccountEmployeeResponseModelCopyWith<$Res> {
  __$$_AccountEmployeeResponseModelCopyWithImpl(
      _$_AccountEmployeeResponseModel _value,
      $Res Function(_$_AccountEmployeeResponseModel) _then)
      : super(_value, (v) => _then(v as _$_AccountEmployeeResponseModel));

  @override
  _$_AccountEmployeeResponseModel get _value =>
      super._value as _$_AccountEmployeeResponseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? description = freezed,
    Object? yearsOfExperience = freezed,
    Object? isPublic = freezed,
    Object? company = freezed,
  }) {
    return _then(_$_AccountEmployeeResponseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsOfExperience: yearsOfExperience == freezed
          ? _value.yearsOfExperience
          : yearsOfExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as AccountCompanyResponseModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountEmployeeResponseModel implements _AccountEmployeeResponseModel {
  _$_AccountEmployeeResponseModel(
      {this.id,
      this.role,
      this.description,
      this.yearsOfExperience,
      this.isPublic,
      this.company});

  factory _$_AccountEmployeeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountEmployeeResponseModelFromJson(json);

  @override
  int? id;
  @override
  String? role;
  @override
  String? description;
  @override
  int? yearsOfExperience;
  @override
  bool? isPublic;
  @override
  AccountCompanyResponseModel? company;

  @override
  String toString() {
    return 'AccountEmployeeResponseModel(id: $id, role: $role, description: $description, yearsOfExperience: $yearsOfExperience, isPublic: $isPublic, company: $company)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AccountEmployeeResponseModelCopyWith<_$_AccountEmployeeResponseModel>
      get copyWith => __$$_AccountEmployeeResponseModelCopyWithImpl<
          _$_AccountEmployeeResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountEmployeeResponseModelToJson(this);
  }
}

abstract class _AccountEmployeeResponseModel
    implements AccountEmployeeResponseModel {
  factory _AccountEmployeeResponseModel(
      {int? id,
      String? role,
      String? description,
      int? yearsOfExperience,
      bool? isPublic,
      AccountCompanyResponseModel? company}) = _$_AccountEmployeeResponseModel;

  factory _AccountEmployeeResponseModel.fromJson(Map<String, dynamic> json) =
      _$_AccountEmployeeResponseModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get role => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  int? get yearsOfExperience => throw _privateConstructorUsedError;
  @override
  bool? get isPublic => throw _privateConstructorUsedError;
  @override
  AccountCompanyResponseModel? get company =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountEmployeeResponseModelCopyWith<_$_AccountEmployeeResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
