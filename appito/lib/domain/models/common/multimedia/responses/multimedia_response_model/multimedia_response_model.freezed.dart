// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'multimedia_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MultimediaResponseModel _$MultimediaResponseModelFromJson(
    Map<String, dynamic> json) {
  return _MultimediaResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MultimediaResponseModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  set url(String? value) => throw _privateConstructorUsedError;
  String? get blurhash => throw _privateConstructorUsedError;
  set blurhash(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultimediaResponseModelCopyWith<MultimediaResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultimediaResponseModelCopyWith<$Res> {
  factory $MultimediaResponseModelCopyWith(MultimediaResponseModel value,
          $Res Function(MultimediaResponseModel) then) =
      _$MultimediaResponseModelCopyWithImpl<$Res>;
  $Res call({int? id, String? url, String? blurhash});
}

/// @nodoc
class _$MultimediaResponseModelCopyWithImpl<$Res>
    implements $MultimediaResponseModelCopyWith<$Res> {
  _$MultimediaResponseModelCopyWithImpl(this._value, this._then);

  final MultimediaResponseModel _value;
  // ignore: unused_field
  final $Res Function(MultimediaResponseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? blurhash = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      blurhash: blurhash == freezed
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MultimediaResponseModelCopyWith<$Res>
    implements $MultimediaResponseModelCopyWith<$Res> {
  factory _$$_MultimediaResponseModelCopyWith(_$_MultimediaResponseModel value,
          $Res Function(_$_MultimediaResponseModel) then) =
      __$$_MultimediaResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? url, String? blurhash});
}

/// @nodoc
class __$$_MultimediaResponseModelCopyWithImpl<$Res>
    extends _$MultimediaResponseModelCopyWithImpl<$Res>
    implements _$$_MultimediaResponseModelCopyWith<$Res> {
  __$$_MultimediaResponseModelCopyWithImpl(_$_MultimediaResponseModel _value,
      $Res Function(_$_MultimediaResponseModel) _then)
      : super(_value, (v) => _then(v as _$_MultimediaResponseModel));

  @override
  _$_MultimediaResponseModel get _value =>
      super._value as _$_MultimediaResponseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? blurhash = freezed,
  }) {
    return _then(_$_MultimediaResponseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      blurhash: blurhash == freezed
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MultimediaResponseModel implements _MultimediaResponseModel {
  _$_MultimediaResponseModel({this.id, this.url, this.blurhash});

  factory _$_MultimediaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_MultimediaResponseModelFromJson(json);

  @override
  int? id;
  @override
  String? url;
  @override
  String? blurhash;

  @override
  String toString() {
    return 'MultimediaResponseModel(id: $id, url: $url, blurhash: $blurhash)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_MultimediaResponseModelCopyWith<_$_MultimediaResponseModel>
      get copyWith =>
          __$$_MultimediaResponseModelCopyWithImpl<_$_MultimediaResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MultimediaResponseModelToJson(this);
  }
}

abstract class _MultimediaResponseModel implements MultimediaResponseModel {
  factory _MultimediaResponseModel({int? id, String? url, String? blurhash}) =
      _$_MultimediaResponseModel;

  factory _MultimediaResponseModel.fromJson(Map<String, dynamic> json) =
      _$_MultimediaResponseModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  String? get blurhash => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MultimediaResponseModelCopyWith<_$_MultimediaResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
