import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_boilerplate/_all.dart';

abstract class IGalleryRepository {
  Future<List<GalleryItem>?> get(GallerySearchModel searchModel);
  Future<List<Album>?> getAlbums();
}

class GalleryRepository implements IGalleryRepository {
  @override
  Future<List<GalleryItem>?> get(GallerySearchModel searchModel) async {
    final albums = await PhotoManager.getAssetPathList(
      onlyAll: !searchModel.albumId.hasValue,
      filterOption: !searchModel.albumId.hasValue ? (FilterOptionGroup()..addOrderOption(const OrderOption(asc: true, type: OrderOptionType.createDate))) : null,
    );
    final assets = await albums
        .where(
          (x) => !searchModel.albumId.hasValue || x.id == searchModel.albumId,
        )
        .firstOrDefault()
        ?.getAssetListPaged(searchModel.page - 1, searchModel.take);

    if (assets == null) {
      return [];
    }

    return await Future.wait(assets
        .where(
          (x) => searchModel.galleryAssetType == null || x.type.index == searchModel.galleryAssetType?.index,
        )
        .map<Future<GalleryItem>>((x) async => await GalleryItem.fromAssetEntity(x) as GalleryItem)
        .toList());
  }

  @override
  Future<List<Album>?> getAlbums() async {
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      hasAll: false,
      onlyAll: false,
    );

    return await Future.wait(albums.map<Future<Album>>((x) async => await Album.fromAssetPathEntity(x) as Album).toList());
  }
}
