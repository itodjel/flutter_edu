import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_boilerplate/_all.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ILocationRepository locationRepository;
  late StreamSubscription _locationBlocSubscription;

  LocationBloc({
    required this.locationRepository,
  }) : super(
          LocationState(status: LocationStateStatus.checking),
        ) {
    _locationBlocSubscription = locationRepository.locationStream.stream.listen((location) {
      add(LocationUpdateEvent(location: location));
    });
  }

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is LocationCheckEvent) {
      yield* _checkLocation();
    } else if (event is LocationInitEvent) {
      yield* _init();
    } else if (event is LocationSelectCurrentLocationEvent) {
      yield* _selectCurrentLocation();
    } else if (event is LocationResetEvent) {
      yield* _reset();
    } else if (event is LocationUpdateEvent) {
      yield* _update(event);
    }
  }

  Stream<LocationState> _checkLocation() async* {
    yield state.copyWith(status: LocationStateStatus.checking);

    if (await locationRepository.isLocationAllowed()) {
      print(':::LOCATION ALLOWED:::');
      yield* _init();
    } else {
      print(':::LOCATION NOT ALLOWED:::');
      yield state.copyWith(status: LocationStateStatus.notAllowed);
      yield state.copyWith(status: LocationStateStatus.notAllowedExplicitly);
    }
  }

  Stream<LocationState> _init() async* {
    if (await checkLocationPermission()) {
      await locationRepository.init();

      final currentLocation = await locationRepository.getCurrentLocation();
      final currentPlaceDetails = await locationRepository.getCurrentPlaceDetails();

      yield state.copyWith(
        status: LocationStateStatus.newAccurateLocation,
        location: Optional(currentLocation),
        placeDetails: Optional(currentPlaceDetails),
      );
    }
  }

  Future<bool> checkLocationPermission() async {
    if (await Permission.location.isGranted) {
      return true;
    }

    if (await Permission.location.isRestricted || await Permission.location.isDenied) {
      return await locationRepository.requestPermission();
    }

    if (await Permission.location.isPermanentlyDenied) {
      await locationRepository.requestPermission();
      return await showRequestRationale(Permission.location);
    }

    return false;
  }

  Stream<LocationState> _reset() async* {
    yield LocationState(status: LocationStateStatus.newLocation);
  }

  Stream<LocationState> _selectCurrentLocation() async* {
    await locationRepository.init();
    final currentLocation = await locationRepository.getCurrentLocation();
    final currentPlaceDetails = await locationRepository.getCurrentPlaceDetails();

    yield state.copyWith(
      status: LocationStateStatus.newAccurateLocation,
      location: Optional(currentLocation),
      placeDetails: Optional(currentPlaceDetails),
    );
  }

  Stream<LocationState> _update(LocationUpdateEvent event) async* {
    PlaceDetailsModel? currentPlaceDetails;

    if (event.location.latitude != null && event.location.longitude != null) {
      currentPlaceDetails = await locationRepository.getPlaceDetails(latitude: event.location.latitude!, longitude: event.location.longitude!);
    }

    yield state.copyWith(
      status: LocationStateStatus.newAccurateLocation,
      location: Optional(event.location),
      placeDetails: Optional(currentPlaceDetails),
    );
  }

  @override
  Future<void> close() {
    _locationBlocSubscription.cancel();

    return super.close();
  }
}
