import 'package:freezed_annotation/freezed_annotation.dart';

part 'multimedia_response_model.freezed.dart';
part 'multimedia_response_model.g.dart';

@unfreezed
class MultimediaResponseModel with _$MultimediaResponseModel {
  factory MultimediaResponseModel({
    int? id,
    String? url,
    String? blurhash,
  }) = _MultimediaResponseModel;

  factory MultimediaResponseModel.fromJson(Map<String, dynamic> json) => _$MultimediaResponseModelFromJson(json);
}
