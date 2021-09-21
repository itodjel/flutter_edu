import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryItem {
  String? id;
  File? file;
  bool? isSelected;

  GalleryItem({
    this.id,
    this.file,
    this.isSelected,
  }) {
    id ??= const Uuid().v4();
  }

  static Future<GalleryItem?> fromAssetEntity(AssetEntity? assetEntity) async {
    if (assetEntity == null) {
      return null;
    }

    return GalleryItem(
      id: assetEntity.id,
      file: await assetEntity.file,
      isSelected: false,
    );
  }
}
