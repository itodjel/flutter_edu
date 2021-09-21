import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_boilerplate/_all.dart';

class GooglePlacesSuggestTextField extends StatefulWidget {
  final bool? isRequired;
  final String? hintText;
  final String? requiredText;
  final FocusNode? focusNode;
  final String Function(PlaceDetails placeDetails)? valueCallback;
  final TextEditingController? controller;
  final void Function(PlaceDetails? placeDetails, GooglePlacesSuggestPlaceModel? googlePlacesSuggestPlace)? onSuggestionSelected;
  final TextStyle? style;
  final InputDecoration? decoration;

  GooglePlacesSuggestTextField({
    this.hintText,
    this.controller,
    this.isRequired,
    this.requiredText,
    this.focusNode,
    this.valueCallback,
    this.onSuggestionSelected,
    this.style,
    this.decoration,
  });

  @override
  _GooglePlacesSuggestTextFieldState createState() => _GooglePlacesSuggestTextFieldState();
}

class _GooglePlacesSuggestTextFieldState extends State<GooglePlacesSuggestTextField> {
  final searchController = TextEditingController();
  late GoogleMapsPlaces places;

  @override
  void initState() {
    super.initState();

    places = GoogleMapsPlaces(apiKey: context.appSettings.googlePlacesApiKey);
  }

  @override
  void dispose() {
    places.dispose();
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller ?? searchController;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            style: widget.style,
            controller: controller,
            focusNode: widget.focusNode,
            decoration: widget.decoration ??
                InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: context.theme.inputDecorationTheme.hintStyle,
                  enabledBorder: ((widget.isRequired ?? false) && controller.text.isEmpty) ? context.theme.inputDecorationTheme.errorBorder : null,
                  suffix: InkWell(
                    onTap: () {
                      controller.text = '';
                      context.unfocus();

                      if (widget.onSuggestionSelected != null) {
                        widget.onSuggestionSelected!(null, null);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(00),
                      child: Icon(
                        AppIcons.closeChip,
                        size: 14,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ),
                ),
          ),
          suggestionsCallback: (pattern) async {
            final placesAutocompleteResponse = await places.autocomplete(pattern);

            return placesAutocompleteResponse.predictions;
          },
          itemBuilder: (context, Prediction prediction) {
            return ListTile(
              title: Text(prediction.description.value),
            );
          },
          hideOnEmpty: true,
          hideOnError: true,
          hideOnLoading: true,
          onSuggestionSelected: (Prediction prediction) async {
            final detail = await places.getDetailsByPlaceId(prediction.placeId.value);
            controller.text = detail.result.name;
            controller.text = widget.valueCallback != null ? widget.valueCallback!(detail.result) : detail.result.name;

            if (widget.onSuggestionSelected != null) {
              widget.onSuggestionSelected!(detail.result, GooglePlacesSuggestPlaceModel.fromPlaceDetails(detail.result));
            }
          },
        ),
        if ((widget.isRequired ?? false) && controller.text.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              widget.requiredText ?? '',
              style: TextStyle(
                color: context.theme.inputDecorationTheme.errorBorder!.borderSide.color,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
      ],
    );
  }
}

class GooglePlacesSuggestPlaceModel {
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

  static GooglePlacesSuggestPlaceModel fromPlaceDetails(PlaceDetails placeDetails) {
    final place = GooglePlacesSuggestPlaceModel();

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
