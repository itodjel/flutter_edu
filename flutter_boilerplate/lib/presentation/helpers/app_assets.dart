import 'dart:io';

class AppAssets {
  static const applicationLogo = 'assets/images/application/applicationLogo.png';
  static const applicationSplash = 'assets/images/application/applicationSplash.png';

  static const flagUK = 'assets/images/flags/flagUK.png';
  static const flagBA = 'assets/images/flags/flagBA.png';

  static const mapPin = 'assets/images/map/mapPin.png';
  static const mapPin2x = 'assets/images/map/mapPin2x.png';
  static String get mapPinByPlatform => Platform.isIOS ? mapPin : mapPin2x;

  static const onboarding1 = 'assets/images/onboarding/onBoarding1.jpg';
  static const onboarding2 = 'assets/images/onboarding/onBoarding2.jpg';
  static const onboarding3 = 'assets/images/onboarding/onBoarding3.jpg';

  static const placeholderPhoto = 'assets/images/placeholders/placeholderPhoto.png';
  static const placeholderNoContent = 'assets/images/placeholders/placeholderNoContent.png';

  static const googleMapsMapStyle = 'assets/other/googleMapsMapStyle.txt';
}
