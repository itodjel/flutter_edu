import 'package:flutter_boilerplate/_all.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final IGalleryRepository galleryRepository;

  GalleryBloc({
    required this.galleryRepository,
  }) : super(initialState());

  static GalleryState initialState() => GalleryState(
        allowMultiple: true,
        status: GalleryStateStatus.loading,
        items: [],
        albums: [],
        searchModel: GallerySearchModel(
          galleryAssetType: GalleryAssetType.image,
        ),
      );

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is GalleryLoadAlbumsEvent) {
      yield* _loadAlbums();
    } else if (event is GalleryLoadEvent) {
      yield* _load(event);
    } else if (event is GalleryRefreshEvent) {
      yield* _refresh();
    } else if (event is GalleryLoadMoreEvent) {
      yield* _loadMore();
    } else if (event is GalleryAddItemEvent) {
      yield* _addItem(event);
    } else if (event is GalleryToggleItemEvent) {
      yield* _toggleItem(event);
    } else if (event is GalleryResetEvent) {
      yield* _reset();
    } else if (event is GalleryInitEvent) {
      yield* _init();
    }
  }

  Stream<GalleryState> _init() async* {
    yield state.copyWith(
      status: GalleryStateStatus.loaded,
      items: [],
      albums: [],
      searchModel: GallerySearchModel(
        galleryAssetType: GalleryAssetType.image,
      ),
      allowMultiple: false,
    );
  }

  Stream<GalleryState> _loadAlbums() async* {
    if (await Permission.storage.check()) {
      yield state.copyWith(status: GalleryStateStatus.loadingAlbums);

      final albums = await galleryRepository.getAlbums();

      yield state.copyWith(status: GalleryStateStatus.loaded, albums: albums);
    }
  }

  Stream<GalleryState> _load(GalleryLoadEvent event) async* {
    if (await Permission.storage.check()) {
      final searchModel = event.searchModel ?? state.searchModel;

      yield state.copyWith(
        status: GalleryStateStatus.loading,
        searchModel: searchModel,
        allowMultiple: event.allowMultiple,
      );

      yield* _refresh();
    }
  }

  Stream<GalleryState> _refresh() async* {
    final searchModel = state.searchModel;
    searchModel.reset();

    final items = await galleryRepository.get(searchModel);

    yield state.copyWith(
      status: GalleryStateStatus.refreshed,
      items: items,
      searchModel: searchModel,
    );
  }

  Stream<GalleryState> _loadMore() async* {
    final searchModel = state.searchModel;

    searchModel.increment();

    final items = await galleryRepository.get(searchModel);

    if (items?.isNotEmpty ?? true) {
      final all = List<GalleryItem>.from(state.items);
      all.addAll(items!);

      yield state.copyWith(status: GalleryStateStatus.loadedMore, items: all, searchModel: searchModel);
    } else {
      yield state.copyWith(status: GalleryStateStatus.loaded);
    }
  }

  Stream<GalleryState> _addItem(GalleryAddItemEvent event) async* {
    if (!state.allowMultiple) {
      for (final x in state.items) {
        x.isSelected = false;
      }
    }

    state.items.insert(0, event.galleryItem);
    yield state.copyWith();
  }

  Stream<GalleryState> _toggleItem(GalleryToggleItemEvent event) async* {
    if (!state.allowMultiple) {
      for (final x in state.items) {
        x.isSelected = false;
      }
    }

    final item = state.items.firstOrDefault((x) => x.id == event.galleryItem.id);
    if (item != null) {
      item.isSelected = !(item.isSelected ?? false);

      yield state.copyWith();
    }
  }

  Stream<GalleryState> _reset() async* {
    yield* _refresh();
  }
}
