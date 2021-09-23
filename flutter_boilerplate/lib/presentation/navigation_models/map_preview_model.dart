import 'package:flutter_boilerplate/_all.dart';

class MapPreviewModel {
  final Key? key;
  final double? initialLatitude;
  final double? initialLongitude;
  final bool showFullScreenIcon;
  final void Function()? onTapFullScreen;
  final bool showCloseIcon;
  final void Function()? onTapClose;
  final bool zoomControlsEnabled;
  final void Function(LatLng location)? onTap;
  final bool showApplyButton;
  final List<LatLng>? coordinates;
  final bool useInitialCameraPosition;

  MapPreviewModel({
    this.key,
    this.initialLatitude,
    this.initialLongitude,
    this.showFullScreenIcon = true,
    this.onTapFullScreen,
    this.showCloseIcon = false,
    this.onTapClose,
    this.zoomControlsEnabled = true,
    this.onTap,
    this.showApplyButton = false,
    this.coordinates,
    this.useInitialCameraPosition = false,
  });

  MapPreviewModel copyWith({
    Key? key,
    double? initialLatitude,
    double? initialLongitude,
    bool? showFullScreenIcon,
    void Function()? onTapFullScreen,
    bool? showCloseIcon,
    void Function()? onTapClose,
    bool? zoomControlsEnabled,
    void Function(LatLng location)? onTap,
    bool? showApplyButton,
    List<LatLng>? coordinates,
    bool? useInitialCameraPosition,
  }) =>
      MapPreviewModel(
        key: key ?? this.key,
        initialLatitude: initialLatitude ?? this.initialLatitude,
        initialLongitude: initialLongitude ?? this.initialLongitude,
        showFullScreenIcon: showFullScreenIcon ?? this.showFullScreenIcon,
        onTapFullScreen: onTapFullScreen ?? this.onTapFullScreen,
        showCloseIcon: showCloseIcon ?? this.showCloseIcon,
        onTapClose: onTapClose ?? this.onTapClose,
        zoomControlsEnabled: zoomControlsEnabled ?? this.zoomControlsEnabled,
        onTap: onTap ?? this.onTap,
        showApplyButton: showApplyButton ?? this.showApplyButton,
        coordinates: coordinates ?? this.coordinates,
        useInitialCameraPosition: useInitialCameraPosition ?? this.useInitialCameraPosition,
      );
}
