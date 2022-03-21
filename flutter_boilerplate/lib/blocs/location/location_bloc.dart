import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_boilerplate/_all.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ILocationRepository locationRepository;
  late StreamSubscription _locationBlocSubscription;

  LocationBloc({
    required this.locationRepository,
  }) : super(initialState()) {
    on<LocationInitEvent>(_init);
    on<LocationCheckEvent>(_check);
    on<LocationSelectCurrentLocationEvent>(_selectCurrentLocation);
    on<LocationResetEvent>(_reset);
    on<LocationUpdateEvent>(_update);

    _locationBlocSubscription = locationRepository.locationStream.stream.listen((location) {
      add(LocationUpdateEvent(location: location));
    });
  }

  static LocationState initialState() => LocationState(status: LocationStateStatus.checking);

  Future<void> _check(LocationCheckEvent event, Emitter<LocationState> emit) async {
    emit(state.copyWith(status: LocationStateStatus.checking));

    if (await locationRepository.isLocationAllowed()) {
      print(':::LOCATION ALLOWED:::');
      if (await checkLocationPermission()) {
        await locationRepository.init();

        final currentLocation = await locationRepository.getCurrentLocation();
        final currentPlaceDetails = await locationRepository.getCurrentPlaceDetails();

        emit(state.copyWith(
          status: LocationStateStatus.newAccurateLocation,
          location: Optional(currentLocation),
          placeDetails: Optional(currentPlaceDetails),
        ));
      }
    } else {
      print(':::LOCATION NOT ALLOWED:::');
      emit(state.copyWith(status: LocationStateStatus.notAllowed));
      emit(state.copyWith(status: LocationStateStatus.notAllowedExplicitly));
    }
  }

  Future<void> _init(LocationInitEvent event, Emitter<LocationState> emit) async {
    if (await checkLocationPermission()) {
      await locationRepository.init();

      final currentLocation = await locationRepository.getCurrentLocation();
      final currentPlaceDetails = await locationRepository.getCurrentPlaceDetails();

      emit(state.copyWith(
        status: LocationStateStatus.newAccurateLocation,
        location: Optional(currentLocation),
        placeDetails: Optional(currentPlaceDetails),
      ));
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

  Future<void> _reset(LocationResetEvent event, Emitter<LocationState> emit) async {
    emit(LocationState(status: LocationStateStatus.newLocation));
  }

  Future<void> _selectCurrentLocation(LocationSelectCurrentLocationEvent event, Emitter<LocationState> emit) async {
    await locationRepository.init();
    final currentLocation = await locationRepository.getCurrentLocation();
    final currentPlaceDetails = await locationRepository.getCurrentPlaceDetails();

    emit(state.copyWith(
      status: LocationStateStatus.newAccurateLocation,
      location: Optional(currentLocation),
      placeDetails: Optional(currentPlaceDetails),
    ));
  }

  Future<void> _update(LocationUpdateEvent event, Emitter<LocationState> emit) async {
    PlaceDetailsModel? currentPlaceDetails;

    if (event.location.latitude != null && event.location.longitude != null) {
      currentPlaceDetails = await locationRepository.getPlaceDetails(latitude: event.location.latitude!, longitude: event.location.longitude!);
    }

    emit(state.copyWith(
      status: LocationStateStatus.newAccurateLocation,
      location: Optional(event.location),
      placeDetails: Optional(currentPlaceDetails),
    ));
  }

  @override
  Future<void> close() {
    _locationBlocSubscription.cancel();

    return super.close();
  }
}
