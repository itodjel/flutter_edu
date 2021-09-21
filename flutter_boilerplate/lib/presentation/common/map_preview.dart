import 'package:flutter_boilerplate/_all.dart';

class MapPreview extends StatefulWidget {
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

  MapPreview({
    Key? key,
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
  }) : super(key: key);

  @override
  _MapPreviewState createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> with WidgetsBindingObserver {
  late BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;
  late String _mapStyle;
  final Completer<GoogleMapController> _controllerCompleter = Completer();

  LatLng get initialCameraPosition {
    if (widget.initialLatitude != null && widget.initialLongitude != null) {
      return LatLng(widget.initialLatitude!, widget.initialLongitude!);
    }

    if (context.locationBloc.state.latitude != null && context.locationBloc.state.longitude != null) {
      return LatLng(context.locationBloc.state.latitude!, context.locationBloc.state.longitude!);
    }

    return LatLng(context.appSettings.defaultLocation.latitude!, context.appSettings.defaultLocation.longitude!);
  }

  @override
  void initState() {
    super.initState();
    setCustomPin();
    WidgetsBinding.instance!.addObserver(this);
    rootBundle.loadString(AppAssets.googleMapsMapStyle).then((string) => _mapStyle = string);
  }

  Future<void> setCustomPin() async {
    final icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(50, 50)),
      AppAssets.mapPinByPlatform,
    );

    setState(() {
      customMarker = icon;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_controllerCompleter.isCompleted) {
        _controllerCompleter.future.then((controller) {
          controller.setMapStyle(_mapStyle);
        });
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              key: widget.key,
              onTap: widget.onTap,
              compassEnabled: false,
              mapToolbarEnabled: false,
              myLocationEnabled: false,
              zoomControlsEnabled: widget.zoomControlsEnabled,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: initialCameraPosition,
                zoom: 6.0,
              ),
              onMapCreated: _onMapCreated,
              markers: _getMarkers(widget.coordinates),
              //gestureRecognizers: {Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())},
            ),
            () {
              if (widget.showFullScreenIcon) {
                return Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.all(13),
                    child: PhysicalModel(
                      elevation: 1,
                      color: Colors.white,
                      child: Splashable(
                        onTap: widget.onTapFullScreen ??
                            () {
                              context.pushPage(MapPreview(
                                initialLatitude: widget.initialLatitude,
                                initialLongitude: widget.initialLongitude,
                                showFullScreenIcon: false,
                                showCloseIcon: true,
                                onTapClose: widget.onTapClose,
                                onTap: widget.onTap,
                                zoomControlsEnabled: widget.zoomControlsEnabled,
                              ));
                            },
                        child: const Padding(
                          padding: EdgeInsets.all(6.5),
                          child: Icon(Icons.fullscreen),
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (widget.showApplyButton) {
                return Positioned(
                  bottom: 30,
                  child: Container(
                    height: 50,
                    width: context.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Button(
                            onTap: () => context.pop(),
                            rounded: true,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  AppIcons.marker,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Apply location',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                // return Positioned(
                //   bottom: 48,
                //   left: 100,
                //   right: 100,
                //   child: PhysicalModel(
                //     elevation: 1,
                //     color: Colors.white,
                //     child: Splashable(
                //       onTap: () => context.pop(),
                //       child: const Padding(
                //         padding: EdgeInsets.all(6.5),
                //         child: Button(
                //           text: 'Apply location',
                //           color: Colors.white,
                //           textColor: Colors.black,
                //           shrinkWrap: false,
                //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //           rounded: true,
                //         ),
                //       ),
                //     ),
                //   ),
                // );
              }

              if (widget.showCloseIcon) {
                return Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.all(13),
                    child: PhysicalModel(
                      elevation: 1,
                      color: Colors.white,
                      child: Splashable(
                        onTap: widget.onTapClose ?? () => context.pop(),
                        child: const Padding(
                          padding: EdgeInsets.all(6.5),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                );
              }

              return Container();
            }()
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);

    if (!_controllerCompleter.isCompleted) {
      _controllerCompleter.complete(controller);
    }
  }

  Set<Marker> _getMarkers(List<LatLng>? coordinates) {
    final markers = <Marker>{};
    if (widget.useInitialCameraPosition) {
      markers.add(
        _getMarker(
          initialCameraPosition.latitude,
          initialCameraPosition.longitude,
        ),
      );
    }
    if (coordinates != null) {
      for (final item in coordinates) {
        markers.add(
          _getMarker(item.latitude, item.longitude),
        );
      }
    }

    return markers;
  }

  Marker _getMarker(double latitude, double longitude) {
    final markerPosition = LatLng(latitude, longitude);

    final marker = Marker(
      position: markerPosition,
      markerId: MarkerId(markerPosition.toString()),
      //onTap: () => _showMapItemPreviewBottomSheet(),
      icon: customMarker,
    );

    return marker;
  }
//   void _showMapItemPreviewBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       builder: (context) {
//         return Container(
//           color: context.theme.scaffoldBackgroundColor,
//           child: Wrap(
//             children: [
//               Row(children: const [
//                 Text('Item preview'),
//               ]),
//             ],
//           ),
//         );
//       },
//     );
//   }
}
