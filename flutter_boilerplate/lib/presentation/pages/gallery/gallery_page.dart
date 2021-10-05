import 'package:flutter_boilerplate/_all.dart';
import 'package:flutter_boilerplate/presentation/navigation_models/album_item_model.dart';

class GalleryPage extends StatefulWidget {
  static const route = '/GalleryPage';

  final Function onSelect;

  GalleryPage({required this.onSelect});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();

    context.read<GalleryBloc>().add(GalleryLoadAlbumsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(context.localizer.translations.about)),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BlocBuilder<GalleryBloc, GalleryState>(
            builder: (context, galleryState) {
              if (galleryState.status == GalleryStateStatus.loadingAlbums) {
                return const Loader();
              }

              return ListView.builder(
                itemCount: galleryState.albums.count(),
                itemBuilder: (context, index) {
                  return AlbumWidget(
                    model: AlbumItemModel(
                      album: galleryState.albums[index],
                      onSelect: widget.onSelect,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
