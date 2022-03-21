import 'package:flutter_boilerplate/_all.dart';

class GalleryControls extends StatelessWidget {
  static const route = '/GalleryControls';

  final Function onSelect;

  GalleryControls({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Line.horizontal(),
          const Spacing.verticalM(),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      text: context.translations.clear,
                      onTap: () => context.read<GalleryBloc>().add(GalleryResetEvent()),
                      textColor: Colors.black87,
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.zero,
                      borderColor: context.theme.colorScheme.secondary,
                    ),
                    const Spacing.horizontalM(),
                    BlocBuilder<GalleryBloc, GalleryState>(
                      builder: (context, galleryState) {
                        return Button(
                          text: context.translations.select,
                          onTap: () {
                            onSelect(context);
                          },
                          textColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.zero,
                          color: context.theme.colorScheme.secondary,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
