import 'package:flutter_boilerplate/_all.dart';
import 'package:flutter_boilerplate/presentation/navigation_models/album_item_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlbumWidget extends StatelessWidget {
  static const route = '/AlbumWidget';

  final AlbumItemModel model;

  AlbumWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final photoSize = 70.0;

    return InkWell(
      onTap: () {
        context.navigator.pushNamed(AlbumItemsPage.route, arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: photoSize,
                    height: photoSize,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: () {
                        if (model.album.thumbnailGalleryItem?.file != null) {
                          return Image.file(
                            model.album.thumbnailGalleryItem!.file!,
                            fit: BoxFit.cover,
                          );
                        }

                        return Image.asset(
                          AppAssets.placeholderPhoto,
                          fit: BoxFit.cover,
                        );
                      }(),
                    ),
                  ),
                  const Spacing.horizontalL(),
                  Text(model.album.name.value),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  model.album.assetCount.value.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const Spacing.horizontalS(),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumItemsPage extends StatefulWidget {
  static const route = '/AlbumItemsPage';
  final AlbumItemModel model;
  // final Album album;
  // final Function onSelect;

  AlbumItemsPage({
    required this.model,
  });

  @override
  _AlbumItemsPageState createState() => _AlbumItemsPageState();
}

class _AlbumItemsPageState extends State<AlbumItemsPage> {
  final refreshController = RefreshController();
  late GalleryBloc galleryBloc;
  late bool allowMultiple;
  @override
  void initState() {
    super.initState();

    allowMultiple = context.read<GalleryBloc>().state.allowMultiple;
    galleryBloc = context.read<GalleryBloc>();
    galleryBloc.add(GalleryLoadEvent(searchModel: GallerySearchModel(albumId: widget.model.album.id), allowMultiple: allowMultiple));
  }

  @override
  void dispose() {
    refreshController.dispose();

    galleryBloc.add(GalleryLoadEvent(searchModel: GallerySearchModel(albumId: '')));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.model.album.name.value)),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<GalleryBloc, GalleryState>(
              listener: (context, productsState) {
                if ([GalleryStateStatus.loaded, GalleryStateStatus.loadedMore].contains(productsState.status)) {
                  refreshController.loadComplete();
                }

                if (productsState.status == GalleryStateStatus.refreshed) {
                  refreshController.refreshCompleted();
                }
              },
              builder: (context, galleryState) {
                return SmartRefresher(
                  controller: refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onLoading: () {
                    context.read<GalleryBloc>().add(GalleryLoadMoreEvent());
                  },
                  onRefresh: () {
                    context.read<GalleryBloc>().add(GalleryRefreshEvent());
                  },
                  child: () {
                    if (galleryState.status == GalleryStateStatus.loading) {
                      return const Loader();
                    }

                    if (galleryState.items.isEmpty) {
                      return Container(
                        child: Center(
                          child: Text(context.localizer.translations.noContent),
                        ),
                      );
                    }

                    return GridView.builder(
                      itemCount: galleryState.items.count(),
                      itemBuilder: (context, index) => GalleryItemWidget(galleryItem: galleryState.items[index]),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    );
                  }(),
                );
              },
            ),
          ),
          GalleryControls(onSelect: widget.model.onSelect),
        ],
      ),
    );
  }
}
