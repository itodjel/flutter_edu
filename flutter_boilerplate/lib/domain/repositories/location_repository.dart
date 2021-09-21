import 'package:google_maps_webservice/places.dart' as google_maps_webservice;
import 'package:location/location.dart';
import 'package:flutter_boilerplate/_all.dart';

abstract class ILocationRepository {
  late StreamController<LocationModel> locationStream;

  Future<bool> isLocationAllowed();
  Future<bool> requestPermission();
  Future<LocationModel?> getCurrentLocation();
  Future<PlaceDetailsModel?> getPlaceDetails({required double latitude, required double longitude});
  Future<PlaceDetailsModel?> getCurrentPlaceDetails();
  Future init();
}

class LocationRepository implements ILocationRepository {
  late Location _location;

  @override
  late StreamController<LocationModel> locationStream = StreamController<LocationModel>.broadcast();

  final AppSettings appSettings;

  LocationRepository({
    required this.appSettings,
  }) {
    _location = Location();
  }

  @override
  Future<bool> isLocationAllowed() async {
    final permissionStatus = await _location.hasPermission();

    return permissionStatus == PermissionStatus.granted || permissionStatus == PermissionStatus.grantedLimited;
  }

  @override
  Future<bool> requestPermission() async {
    final permissionStatus = await _location.requestPermission();

    return permissionStatus == PermissionStatus.granted || permissionStatus == PermissionStatus.grantedLimited;
  }

  Future<LocationModel?> currentLocation() async {
    final locationData = await _location.getLocation();

    if (locationData.latitude != null && locationData.longitude != null) {
      return LocationModel(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      );
    }

    return null;
  }

  @override
  Future<PlaceDetailsModel?> getPlaceDetails({required double latitude, required double longitude}) async {
    try {
      final googleMapsPlaces = google_maps_webservice.GoogleMapsPlaces(apiKey: appSettings.googlePlacesApiKey);
      final response = await googleMapsPlaces.searchNearbyWithRadius(google_maps_webservice.Location(lat: latitude, lng: longitude), 500);

      final placeSearchResult = response.results.firstOrDefault();

      if (placeSearchResult == null) {
        return PlaceDetailsModel(latitude: latitude, longitude: longitude);
      }

      final detail = await googleMapsPlaces.getDetailsByPlaceId(placeSearchResult.placeId);

      return PlaceDetailsModel.fromPlaceDetails(detail.result);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<PlaceDetailsModel?> getCurrentPlaceDetails() async {
    try {
      final location = await getCurrentLocation();

      if (location != null && location.longitude != null && location.longitude != null) {
        return getPlaceDetails(latitude: location.latitude!, longitude: location.longitude!);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<LocationModel?> getCurrentLocation() async {
    final locationData = await _location.getLocation();

    if (locationData.latitude != null && locationData.longitude != null) {
      return LocationModel(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      );
    }

    return null;
  }

  @override
  Future init() async {
    print(':::INITIALIZING LOCATION:::');

    var serviceEnabled = await _location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    print(':::LOCATION SERVICE IS ENABLED AND LOCATION PERMISSION IS GRANTED:::');

    try {
      final locationData = await _location.getLocation();

      if (locationData.latitude != null && locationData.longitude != null) {
        locationStream.add(LocationModel(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        ));
      }
    } catch (e) {
      print(e);
    }
  }
}
