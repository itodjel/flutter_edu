import 'package:flutter_boilerplate/_all.dart';

class AlbumItemModel {
  final Album album;
  final Function onSelect;

  AlbumItemModel({
    required this.album,
    required this.onSelect,
  });

  AlbumItemModel copyWith({
    final Album? album,
    final Function()? onSelect,
  }) =>
      AlbumItemModel(
        album: album ?? this.album,
        onSelect: onSelect ?? this.onSelect,
      );
}
