// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountResponseModel _$AccountResponseModelFromJson(Map<String, dynamic> json) {
  return _AccountResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AccountResponseModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  set userName(String? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String? value) => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  set firstName(String? value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  set photoUrl(String? value) => throw _privateConstructorUsedError;
  String? get timezoneId => throw _privateConstructorUsedError;
  set timezoneId(String? value) => throw _privateConstructorUsedError;
  AccountType? get accountType => throw _privateConstructorUsedError;
  set accountType(AccountType? value) => throw _privateConstructorUsedError;
  MultimediaResponseModel? get profilePhoto =>
      throw _privateConstructorUsedError;
  set profilePhoto(MultimediaResponseModel? value) =>
      throw _privateConstructorUsedError;
  AccountCompanyResponseModel? get currentCompany =>
      throw _privateConstructorUsedError;
  set currentCompany(AccountCompanyResponseModel? value) =>
      throw _privateConstructorUsedError;
  List<AccountExternalUserResponseModel>? get externalUsers =>
      throw _privateConstructorUsedError;
  set externalUsers(List<AccountExternalUserResponseModel>? value) =>
      throw _privateConstructorUsedError;
  List<AccountEmployeeResponseModel>? get employees =>
      throw _privateConstructorUsedError;
  set employees(List<AccountEmployeeResponseModel>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountResponseModelCopyWith<AccountResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountResponseModelCopyWith<$Res> {
  factory $AccountResponseModelCopyWith(AccountResponseModel value,
          $Res Function(AccountResponseModel) then) =
      _$AccountResponseModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? userName,
      String? email,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? photoUrl,
      String? timezoneId,
      AccountType? accountType,
      MultimediaResponseModel? profilePhoto,
      AccountCompanyResponseModel? currentCompany,
      List<AccountExternalUserResponseModel>? externalUsers,
      List<AccountEmployeeResponseModel>? employees});

  $MultimediaResponseModelCopyWith<$Res>? get profilePhoto;
  $AccountCompanyResponseModelCopyWith<$Res>? get currentCompany;
}

/// @nodoc
class _$AccountResponseModelCopyWithImpl<$Res>
    implements $AccountResponseModelCopyWith<$Res> {
  _$AccountResponseModelCopyWithImpl(this._value, this._then);

  final AccountResponseModel _value;
  // ignore: unused_field
  final $Res Function(AccountResponseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? photoUrl = freezed,
    Object? timezoneId = freezed,
    Object? accountType = freezed,
    Object? profilePhoto = freezed,
    Object? currentCompany = freezed,
    Object? externalUsers = freezed,
    Object? employees = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timezoneId: timezoneId == freezed
          ? _value.timezoneId
          : timezoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as MultimediaResponseModel?,
      currentCompany: currentCompany == freezed
          ? _value.currentCompany
          : currentCompany // ignore: cast_nullable_to_non_nullable
              as AccountCompanyResponseModel?,
      externalUsers: externalUsers == freezed
          ? _value.externalUsers
          : externalUsers // ignore: cast_nullable_to_non_nullable
              as List<AccountExternalUserResponseModel>?,
      employees: employees == freezed
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<AccountEmployeeResponseModel>?,
    ));
  }

  @override
  $MultimediaResponseModelCopyWith<$Res>? get profilePhoto {
    if (_value.profilePhoto == null) {
      return null;
    }

    return $MultimediaResponseModelCopyWith<$Res>(_value.profilePhoto!,
        (value) {
      return _then(_value.copyWith(profilePhoto: value));
    });
  }

  @override
  $AccountCompanyResponseModelCopyWith<$Res>? get currentCompany {
    if (_value.currentCompany == null) {
      return null;
    }

    return $AccountCompanyResponseModelCopyWith<$Res>(_value.currentCompany!,
        (value) {
      return _then(_value.copyWith(currentCompany: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountResponseModelCopyWith<$Res>
    implements $AccountResponseModelCopyWith<$Res> {
  factory _$$_AccountResponseModelCopyWith(_$_AccountResponseModel value,
          $Res Function(_$_AccountResponseModel) then) =
      __$$_AccountResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? userName,
      String? email,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? photoUrl,
      String? timezoneId,
      AccountType? accountType,
      MultimediaResponseModel? profilePhoto,
      AccountCompanyResponseModel? currentCompany,
      List<AccountExternalUserResponseModel>? externalUsers,
      List<AccountEmployeeResponseModel>? employees});

  @override
  $MultimediaResponseModelCopyWith<$Res>? get profilePhoto;
  @override
  $AccountCompanyResponseModelCopyWith<$Res>? get currentCompany;
}

/// @nodoc
class __$$_AccountResponseModelCopyWithImpl<$Res>
    extends _$AccountResponseModelCopyWithImpl<$Res>
    implements _$$_AccountResponseModelCopyWith<$Res> {
  __$$_AccountResponseModelCopyWithImpl(_$_AccountResponseModel _value,
      $Res Function(_$_AccountResponseModel) _then)
      : super(_value, (v) => _then(v as _$_AccountResponseModel));

  @override
  _$_AccountResponseModel get _value => super._value as _$_AccountResponseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? photoUrl = freezed,
    Object? timezoneId = freezed,
    Object? accountType = freezed,
    Object? profilePhoto = freezed,
    Object? currentCompany = freezed,
    Object? externalUsers = freezed,
    Object? employees = freezed,
  }) {
    return _then(_$_AccountResponseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timezoneId: timezoneId == freezed
          ? _value.timezoneId
          : timezoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as MultimediaResponseModel?,
      currentCompany: currentCompany == freezed
          ? _value.currentCompany
          : currentCompany // ignore: cast_nullable_to_non_nullable
              as AccountCompanyResponseModel?,
      externalUsers: externalUsers == freezed
          ? _value.externalUsers
          : externalUsers // ignore: cast_nullable_to_non_nullable
              as List<AccountExternalUserResponseModel>?,
      employees: employees == freezed
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<AccountEmployeeResponseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountResponseModel implements _AccountResponseModel {
  _$_AccountResponseModel(
      {this.id,
      this.userName,
      this.email,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.photoUrl,
      this.timezoneId,
      this.accountType,
      this.profilePhoto,
      this.currentCompany,
      this.externalUsers,
      this.employees});

  factory _$_AccountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountResponseModelFromJson(json);

  @override
  String? id;
  @override
  String? userName;
  @override
  String? email;
  @override
  String? phoneNumber;
  @override
  String? firstName;
  @override
  String? lastName;
  @override
  String? photoUrl;
  @override
  String? timezoneId;
  @override
  AccountType? accountType;
  @override
  MultimediaResponseModel? profilePhoto;
  @override
  AccountCompanyResponseModel? currentCompany;
  @override
  List<AccountExternalUserResponseModel>? externalUsers;
  @override
  List<AccountEmployeeResponseModel>? employees;

  @override
  String toString() {
    return 'AccountResponseModel(id: $id, userName: $userName, email: $email, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, timezoneId: $timezoneId, accountType: $accountType, profilePhoto: $profilePhoto, currentCompany: $currentCompany, externalUsers: $externalUsers, employees: $employees)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AccountResponseModelCopyWith<_$_AccountResponseModel> get copyWith =>
      __$$_AccountResponseModelCopyWithImpl<_$_AccountResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountResponseModelToJson(this);
  }
}

abstract class _AccountResponseModel implements AccountResponseModel {
  factory _AccountResponseModel(
      {String? id,
      String? userName,
      String? email,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? photoUrl,
      String? timezoneId,
      AccountType? accountType,
      MultimediaResponseModel? profilePhoto,
      AccountCompanyResponseModel? currentCompany,
      List<AccountExternalUserResponseModel>? externalUsers,
      List<AccountEmployeeResponseModel>? employees}) = _$_AccountResponseModel;

  factory _AccountResponseModel.fromJson(Map<String, dynamic> json) =
      _$_AccountResponseModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  String? get timezoneId => throw _privateConstructorUsedError;
  @override
  AccountType? get accountType => throw _privateConstructorUsedError;
  @override
  MultimediaResponseModel? get profilePhoto =>
      throw _privateConstructorUsedError;
  @override
  AccountCompanyResponseModel? get currentCompany =>
      throw _privateConstructorUsedError;
  @override
  List<AccountExternalUserResponseModel>? get externalUsers =>
      throw _privateConstructorUsedError;
  @override
  List<AccountEmployeeResponseModel>? get employees =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountResponseModelCopyWith<_$_AccountResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
