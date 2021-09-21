import 'package:google_maps_webservice/places.dart';

class PlaceDetailsModel {
  String? name;
  String? streetNumber;
  String? street;
  String? city;
  String? county;
  String? region;
  String? country;
  String? postalCode;
  String? formattedAddress;
  String? phoneNumber;
  String? phoneNumberRegion;
  double? latitude;
  double? longitude;

  PlaceDetailsModel({
    this.name,
    this.streetNumber,
    this.street,
    this.city,
    this.county,
    this.region,
    this.country,
    this.postalCode,
    this.formattedAddress,
    this.phoneNumber,
    this.phoneNumberRegion,
    this.latitude,
    this.longitude,
  });

  static PlaceDetailsModel fromPlaceDetails(PlaceDetails placeDetails) {
    final place = PlaceDetailsModel();

    try {
      place.name = placeDetails.name;
      place.phoneNumber = placeDetails.internationalPhoneNumber;

      place.latitude = placeDetails.geometry?.location.lat;
      place.longitude = placeDetails.geometry?.location.lng;

      if (placeDetails.addressComponents.isEmpty) {
        return place;
      }

      place.formattedAddress = placeDetails.formattedAddress;

      for (final addressComponent in placeDetails.addressComponents) {
        if (addressComponent.types.contains('street_number')) {
          place.streetNumber = addressComponent.longName;
        } else if (addressComponent.types.contains('route')) {
          place.street = addressComponent.longName;
        } else if (addressComponent.types.contains('locality')) {
          place.city = addressComponent.longName;
        } else if (addressComponent.types.contains('administrative_area_level_2')) {
          place.county = addressComponent.longName;
        } else if (addressComponent.types.contains('administrative_area_level_1')) {
          place.region = addressComponent.longName;
        } else if (addressComponent.types.contains('country')) {
          place.country = addressComponent.longName;
        } else if (addressComponent.types.contains('postal_code')) {
          place.postalCode = addressComponent.longName;
        }
      }
    } catch (e) {
      print('\n\n\nTHERE WAS GOOGLE PLACE DETAILS PARSING EXCEPTION: \n\n $e \n\n\n');
    }

    return place;
  }

  @override
  String toString() {
    var result = '===============================================================\n';

    result += 'Phone number(phoneNumber): $phoneNumber\n';
    result += 'Phone number region(phoneNumberRegion): $phoneNumberRegion\n';
    result += 'Street number(streetNumber): $streetNumber\n';
    result += 'Street(street): $street\n';
    result += 'Formatted Address(formattedAddress): $formattedAddress\n';
    result += 'City(city): $city\n';
    result += 'County(county): $county\n';
    result += 'Region(region): $region\n';
    result += 'Country(country): $country\n';
    result += 'Postal code(postalCode): $postalCode\n';
    result += 'Latitude(latitude): $latitude\n';
    result += 'Longitude(longitude): $longitude\n';

    result += '===============================================================\n';

    return result;
  }
}
