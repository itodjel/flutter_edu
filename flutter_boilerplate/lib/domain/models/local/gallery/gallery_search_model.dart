import 'package:flutter_boilerplate/_all.dart';

class GallerySearchModel extends Pagination {
  GalleryAssetType? galleryAssetType;
  String? albumId;
  bool get loadRecents => !albumId.hasValue;

  GallerySearchModel({
    this.galleryAssetType,
    this.albumId,
    int? skip,
    int? take,
  }) : super(
          skip: skip,
          take: take,
        );

  GallerySearchModel copyWith({
    Optional<GalleryAssetType>? galleryAssetType,
    Optional<String>? albumId,
    Optional<int>? skip,
    Optional<int>? take,
  }) {
    return GallerySearchModel(
      galleryAssetType: galleryAssetType != null ? galleryAssetType.value : this.galleryAssetType,
      albumId: albumId != null ? albumId.value : this.albumId,
      skip: skip != null ? skip.value : this.skip,
      take: take != null ? take.value : this.take,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ...super.toMap(),
      'galleryAssetType': galleryAssetType?.index,
    };
  }
}
