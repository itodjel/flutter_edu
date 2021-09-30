import 'package:flutter_boilerplate/_all.dart';

class GalleryItemWidget extends StatelessWidget {
  static const route = '/GalleryItemWidget';

  final GalleryItem galleryItem;

  GalleryItemWidget({
    required this.galleryItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GalleryBloc>().add(GalleryToggleItemEvent(galleryItem: galleryItem));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          () {
            if (galleryItem.file != null) {
              return Image.file(
                galleryItem.file!,
                fit: BoxFit.cover,
              );
            }

            return Image.asset(
              AppAssets.placeholderPhoto,
              fit: BoxFit.cover,
            );
          }(),
          () {
            if (galleryItem.isSelected ?? false) {
              return Container(
                color: Colors.white54,
                child: Icon(
                  Icons.check,
                  size: 40,
                  color: context.theme.accentColor,
                ),
              );
            }

            return Container();
          }(),
        ],
      ),
    );
  }
}
