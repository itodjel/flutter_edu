import 'package:flutter_boilerplate/_all.dart';

abstract class LocationEvent {}

class LocationInitEvent extends LocationEvent {}

class LocationCheckEvent extends LocationEvent {}

class LocationSelectCurrentLocationEvent extends LocationEvent {}

class LocationResetEvent extends LocationEvent {}

class LocationUpdateEvent extends LocationEvent {
  final LocationModel location;

  LocationUpdateEvent({required this.location});
}
