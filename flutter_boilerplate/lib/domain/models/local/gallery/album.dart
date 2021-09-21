import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_boilerplate/_all.dart';

import 'gallery_item.dart';

class Album {
  String? id;
  String? name;
  int? assetCount;
  GalleryItem? thumbnailGalleryItem;
  bool? isSelected;

  Album({
    this.id,
    this.name,
    this.assetCount,
    this.thumbnailGalleryItem,
    this.isSelected,
  }) {
    id ??= const Uuid().v4();
  }

  static Future<Album?> fromAssetPathEntity(AssetPathEntity? assetPathEntity) async {
    if (assetPathEntity == null) {
      return null;
    }

    return Album(
      id: assetPathEntity.id,
      name: assetPathEntity.name,
      assetCount: assetPathEntity.assetCount,
      thumbnailGalleryItem: await GalleryItem.fromAssetEntity((await assetPathEntity.getAssetListRange(start: 0, end: 1)).firstOrDefault()),
      isSelected: false,
    );
  }
}
