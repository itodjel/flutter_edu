import 'dart:io';

class AppAssets {
  static const aboutUs1 = 'assets/images/aboutUs/aboutUs1.png';
  static const aboutUs2 = 'assets/images/aboutUs/aboutUs2.png';
  static const aboutUs3 = 'assets/images/aboutUs/aboutUs3.png';
  static const aboutUs4 = 'assets/images/aboutUs/aboutUs4.png';
  static const aboutUsCEOSignature = 'assets/images/aboutUs/aboutUsCEOSignature.png';

  static const errorPayment = 'assets/images/stripe/errorPayment.png';

  static const applicationLogo = 'assets/images/application/applicationLogo.png';
  static const applicationSplash = 'assets/images/application/applicationSplash.png';
  static const applicationLogoWhite = 'assets/images/application/applicationLogoWhite.png';

  static const flagUK = 'assets/images/flags/flagUK.png';

  static const mapPin = 'assets/images/map/mapPin.png';
  static const mapPin2x = 'assets/images/map/mapPin2x.png';
  static String get mapPinByPlatform => Platform.isIOS ? mapPin : mapPin2x;

  static const onboarding1 = 'assets/images/onboarding/onBoarding1.png';
  static const onboarding2 = 'assets/images/onboarding/onBoarding2.png';
  static const onboarding3 = 'assets/images/onboarding/onBoarding3.png';
  static const onboardingBackground = 'assets/images/onboarding/onboardingBackground.png';

  static const placeholderPhoto = 'assets/images/placeholders/placeholderPhoto.png';
  static const placeholderNoContent = 'assets/images/placeholders/placeholderNoContent.png';

  static const stripeLogo = 'assets/images/stripe/stripeLogo.png';
  static const stripeSetUp = 'assets/images/stripe/stripeSetUp.png';

  static const codeScanned = 'assets/images/other/codeScanned.png';

  static const googleMapsMapStyle = 'assets/other/googleMapsMapStyle.txt';
}
