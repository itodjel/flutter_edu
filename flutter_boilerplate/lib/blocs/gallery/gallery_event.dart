import '../../_all.dart';

abstract class GalleryEvent {}

class GalleryLoadAlbumsEvent extends GalleryEvent {}

class GalleryInitEvent extends GalleryEvent {}

class GalleryLoadEvent extends GalleryEvent {
  final bool allowMultiple;
  final GallerySearchModel? searchModel;

  GalleryLoadEvent({
    this.allowMultiple = true,
    this.searchModel,
  });
}

class GalleryRefreshEvent extends GalleryEvent {}

class GalleryLoadMoreEvent extends GalleryEvent {}

class GalleryResetEvent extends GalleryEvent {}

class GalleryAddItemEvent extends GalleryEvent {
  final GalleryItem galleryItem;

  GalleryAddItemEvent({
    required this.galleryItem,
  });
}

class GalleryToggleItemEvent extends GalleryEvent {
  final GalleryItem galleryItem;

  GalleryToggleItemEvent({
    required this.galleryItem,
  });
}
