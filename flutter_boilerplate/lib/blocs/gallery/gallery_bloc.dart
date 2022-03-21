import 'package:flutter_boilerplate/_all.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final IGalleryRepository galleryRepository;

  GalleryBloc({
    required this.galleryRepository,
  }) : super(initialState()) {
    on<GalleryInitEvent>(_init);
    on<GalleryLoadEvent>(_load);
    on<GalleryLoadMoreEvent>(_loadMore);
    on<GalleryRefreshEvent>(_refresh);
    on<GalleryLoadAlbumsEvent>(_loadAlbums);
    on<GalleryAddItemEvent>(_addItem);
    on<GalleryToggleItemEvent>(_toggleItem);
    on<GalleryResetEvent>(_reset);
  }

  static GalleryState initialState() => GalleryState(
        allowMultiple: true,
        status: GalleryStateStatus.loading,
        items: [],
        albums: [],
        searchModel: GallerySearchModel(
          galleryAssetType: GalleryAssetType.image,
        ),
      );

  Future<void> _init(GalleryInitEvent event, Emitter<GalleryState> emit) async {
    emit(state.copyWith(
      status: GalleryStateStatus.loaded,
      items: [],
      albums: [],
      searchModel: GallerySearchModel(
        galleryAssetType: GalleryAssetType.image,
      ),
      allowMultiple: false,
    ));
  }

  Future<void> _loadAlbums(GalleryLoadAlbumsEvent event, Emitter<GalleryState> emit) async {
    if (await Permission.storage.check()) {
      emit(state.copyWith(status: GalleryStateStatus.loadingAlbums));

      final albums = await galleryRepository.getAlbums();

      emit(state.copyWith(status: GalleryStateStatus.loaded, albums: albums));
    }
  }

  Future<void> _load(GalleryLoadEvent event, Emitter<GalleryState> emit) async {
    if (await Permission.storage.check()) {
      final searchModel = event.searchModel ?? state.searchModel;

      emit(state.copyWith(
        status: GalleryStateStatus.loading,
        searchModel: searchModel,
        allowMultiple: event.allowMultiple,
      ));

      // yield* _refresh();
      searchModel.reset();

      final items = await galleryRepository.get(searchModel);

      emit(state.copyWith(
        status: GalleryStateStatus.refreshed,
        items: items,
        searchModel: searchModel,
      ));
    } else {
      emit(state.copyWith(status: GalleryStateStatus.permissionDenied));
    }
  }

  Future<void> _refresh(GalleryRefreshEvent event, Emitter<GalleryState> emit) async {
    final searchModel = state.searchModel;
    searchModel.reset();

    final items = await galleryRepository.get(searchModel);

    emit(state.copyWith(
      status: GalleryStateStatus.refreshed,
      items: items,
      searchModel: searchModel,
    ));
  }

  Future<void> _loadMore(GalleryLoadMoreEvent event, Emitter<GalleryState> emit) async {
    emit(state.copyWith(status: GalleryStateStatus.loadingImages));
    final searchModel = state.searchModel;

    searchModel.increment();

    final items = await galleryRepository.get(searchModel);

    if (items?.isNotEmpty ?? true) {
      final all = List<GalleryItem>.from(state.items);
      all.addAll(items!);

      emit(state.copyWith(status: GalleryStateStatus.loadedMore, items: all, searchModel: searchModel));
    } else {
      emit(state.copyWith(status: GalleryStateStatus.loaded));
    }
  }

  Future<void> _addItem(GalleryAddItemEvent event, Emitter<GalleryState> emit) async {
    if (!state.allowMultiple) {
      for (final x in state.items) {
        x.isSelected = false;
      }
    }

    state.items.insert(0, event.galleryItem);
    emit(state.copyWith());
  }

  Future<void> _toggleItem(GalleryToggleItemEvent event, Emitter<GalleryState> emit) async {
    if (!state.allowMultiple) {
      for (final x in state.items) {
        x.isSelected = false;
      }
    }

    final item = state.items.firstOrDefault((x) => x.id == event.galleryItem.id);
    if (item != null) {
      item.isSelected = !(item.isSelected ?? false);

      emit(state.copyWith());
    }
  }

  Future<void> _reset(GalleryResetEvent event, Emitter<GalleryState> emit) async {
    final searchModel = state.searchModel;
    searchModel.reset();

    final items = await galleryRepository.get(searchModel);

    emit(state.copyWith(
      status: GalleryStateStatus.refreshed,
      items: items,
      searchModel: searchModel,
    ));
  }
}
