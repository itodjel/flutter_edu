import 'dart:convert';

import 'package:flutter_boilerplate/_all.dart';

class LocationModel {
  final double? latitude;
  final double? longitude;

  const LocationModel({
    this.latitude,
    this.longitude,
  });

  LocationModel copyWith({
    Optional<double>? latitude,
    Optional<double>? longitude,
  }) {
    return LocationModel(
      latitude: latitude == null ? this.latitude : latitude.value,
      longitude: longitude == null ? this.longitude : longitude.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source));

  @override
  String toString() => 'LocationModel(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LocationModel && other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
