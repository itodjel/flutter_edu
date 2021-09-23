import 'package:flutter_boilerplate/_all.dart';

class MapPreview extends StatefulWidget {
  static const route = '/MapPreview';

  final MapPreviewModel model;

  MapPreview({
    required this.model,
  }) : super(key: model.key);

  @override
  _MapPreviewState createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> with WidgetsBindingObserver {
  late BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;
  late String _mapStyle;
  final Completer<GoogleMapController> _controllerCompleter = Completer();

  LatLng get initialCameraPosition {
    if (widget.model.initialLatitude != null && widget.model.initialLongitude != null) {
      return LatLng(widget.model.initialLatitude!, widget.model.initialLongitude!);
    }

    if (context.locationBloc.state.location?.latitude != null && context.locationBloc.state.location?.longitude != null) {
      return LatLng(context.locationBloc.state.location!.latitude!, context.locationBloc.state.location!.longitude!);
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
              key: widget.model.key,
              onTap: widget.model.onTap,
              compassEnabled: false,
              mapToolbarEnabled: false,
              myLocationEnabled: false,
              zoomControlsEnabled: widget.model.zoomControlsEnabled,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: initialCameraPosition,
                zoom: 6.0,
              ),
              onMapCreated: _onMapCreated,
              markers: _getMarkers(widget.model.coordinates),
              //TODO: Uncomment if you want that the map is scrollable even when in a ListView
              //gestureRecognizers: {Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())},
            ),
            () {
              if (widget.model.showFullScreenIcon) {
                return Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.all(13),
                    child: PhysicalModel(
                      elevation: 1,
                      color: Colors.white,
                      child: Splashable(
                        onTap: widget.model.onTapFullScreen ??
                            () {
                              context.navigator.pushNamed(
                                MapPreview.route,
                                arguments: widget.model.copyWith(
                                  showFullScreenIcon: false,
                                  showCloseIcon: true,
                                ),
                              );
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
              if (widget.model.showApplyButton) {
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
                            onTap: () => context.navigator.pop(),
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
              }

              if (widget.model.showCloseIcon) {
                return Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.all(13),
                    child: PhysicalModel(
                      elevation: 1,
                      color: Colors.white,
                      child: Splashable(
                        onTap: widget.model.onTapClose ?? () => context.navigator.pop(),
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
    if (widget.model.useInitialCameraPosition) {
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
}
