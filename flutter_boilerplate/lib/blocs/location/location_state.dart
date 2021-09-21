import 'package:flutter_boilerplate/_all.dart';

enum LocationStateStatus {
  notAllowed,
  notAllowedExplicitly,
  checking,
  newLocation,
  newAccurateLocation,
}

class LocationState {
  LocationStateStatus status;
  LocationModel? location;
  PlaceDetailsModel? placeDetails;
  bool get isAllowed => [LocationStateStatus.newLocation, LocationStateStatus.newAccurateLocation].contains(status);

  LocationState({
    required this.status,
    this.location,
    this.placeDetails,
  });

  LocationState copyWith({
    LocationStateStatus? status,
    Optional<LocationModel>? location,
    Optional<PlaceDetailsModel>? placeDetails,
  }) =>
      LocationState(
        status: status ?? this.status,
        location: location == null ? this.location : location.value,
        placeDetails: placeDetails == null ? this.placeDetails : placeDetails.value,
      );
}
