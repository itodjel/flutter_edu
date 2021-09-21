class GalleryAssetType {
  static const image = GalleryAssetType._(1);
  static const video = GalleryAssetType._(2);
  static const audio = GalleryAssetType._(3);
  static const other = GalleryAssetType._(4);

  static List<GalleryAssetType> get values => [
        image,
        video,
        audio,
        other,
      ];

  final int index;

  const GalleryAssetType._(this.index);
  static List<int> get indexes => values.map<int>((x) => x.index).toList();
  static GalleryAssetType? getValue(int index) => indexes.contains(index) ? GalleryAssetType._(index) : null;
}
