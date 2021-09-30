import 'dart:io';

import 'package:flutter_boilerplate/_all.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Gallery extends StatefulWidget {
  static const route = '/Gallery';

  final Function onSelect;
  final bool allowMultiple;

  Gallery({
    required this.onSelect,
    required this.allowMultiple,
  });

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final refreshController = RefreshController();

  @override
  void initState() {
    super.initState();

    context.read<GalleryBloc>().add(GalleryLoadEvent(
          allowMultiple: widget.allowMultiple,
        ));
  }

  @override
  void dispose() {
    refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryBloc, GalleryState>(
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

            return GridView.builder(
              itemCount: galleryState.items.count() + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const _TakeAPhotoWidget();
                }

                if (index == 1) {
                  return _OpenGalleryWidget(
                    onSelect: widget.onSelect,
                  );
                }

                return GalleryItemWidget(
                  galleryItem: galleryState.items[index - 2],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            );
          }(),
        );
      },
    );
  }
}

class _TakeAPhotoWidget extends StatelessWidget {
  const _TakeAPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizer = context.localizer;
    final mediaQuery = context.mediaQuery;
    final photoSize = mediaQuery.size.width / 4;

    return LocalImagePicker.camera(
      onImageCropped: (File? file) {
        if (file != null) {
          context.read<GalleryBloc>().add(
                GalleryAddItemEvent(
                  galleryItem: GalleryItem(
                    file: file,
                    isSelected: true,
                  ),
                ),
              );
        }
      },
      useCropper: true,
      child: Container(
        height: photoSize,
        width: photoSize,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_alt,
                color: Colors.red,
                size: 26,
              ),
              const Spacing.horizontalXS(2),
              Text(
                localizer.translations.takeAPhoto.toUpperCase(),
                style: const TextStyle(color: Colors.black, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OpenGalleryWidget extends StatelessWidget {
  final Function onSelect;
  const _OpenGalleryWidget({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizer = context.localizer;
    final mediaQuery = context.mediaQuery;
    final photoSize = mediaQuery.size.width / 4;

    return InkWell(
      onTap: () {
        context.navigator.pop();
        // context.pushPage(GalleryPage(
        //   onSelect: onSelect,
        // ));
        context.navigator.pushNamed(GalleryPage.route, arguments: onSelect);
      },
      child: Container(
        height: photoSize,
        width: photoSize,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.image, color: Colors.red, size: 26),
              const Spacing.horizontalXS(2),
              Text(
                localizer.translations.openGallery.toUpperCase(),
                style: const TextStyle(color: Colors.black, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
