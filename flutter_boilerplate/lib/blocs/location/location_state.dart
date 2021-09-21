import 'package:tailgreeter/_all.dart';

enum LocationStateStatus {
  notAllowed,
  notAllowedExplicitly,
  checking,
  newLocation,
  newAccurateLocation,
}

class LocationState {
  LocationStateStatus status;
  AddressModel? address;
  double? latitude;
  double? longitude;
  bool get isAllowed => [LocationStateStatus.newLocation, LocationStateStatus.newAccurateLocation].contains(status);

  LocationState({
    required this.status,
    this.address,
    this.latitude,
    this.longitude,
  });

  LocationState copyWith({
    LocationStateStatus? status,
    AddressModel? address,
    double? latitude,
    double? longitude,
  }) =>
      LocationState(
        status: status ?? this.status,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
}
