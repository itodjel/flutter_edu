import 'package:flutter_boilerplate/_all.dart';

enum GalleryStateStatus {
  loading,
  loadingAlbums,
  loaded,
  loadedMore,
  refreshed,
  permissionDenied,
}

class GalleryState {
  GalleryStateStatus status;
  bool allowMultiple;
  GallerySearchModel searchModel;
  List<GalleryItem> items;
  List<GalleryItem> get selectedItems => items.where((x) => x.isSelected.value).toList();
  int get selectedItemsCount => selectedItems.length;
  List<Album> albums;
  Album? get currentAlbum => albums.firstOrDefault((x) => x.isSelected ?? false);

  GalleryState({
    required this.status,
    required this.allowMultiple,
    required this.searchModel,
    required this.items,
    required this.albums,
  });

  GalleryState copyWith({
    GalleryStateStatus? status,
    bool? allowMultiple,
    GallerySearchModel? searchModel,
    List<GalleryItem>? items,
    List<Album>? albums,
    GalleryItem? photo,
  }) {
    return GalleryState(
      status: status ?? this.status,
      allowMultiple: allowMultiple ?? this.allowMultiple,
      searchModel: searchModel ?? this.searchModel,
      items: items ?? this.items,
      albums: albums ?? this.albums,
    );
  }
}
