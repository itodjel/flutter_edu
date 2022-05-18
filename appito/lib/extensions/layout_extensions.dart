import 'package:appito/_all.dart';

extension BuildContextLayoutExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  Orientation get orientation => mediaQuery.orientation;

  bool get isLandscape => (orientation == Orientation.landscape);
  bool get isPortrait => (orientation == Orientation.portrait);

  bool get isSmallScreen => (screenWidth <= AppitoBreakpoints.small);
  bool get isMediumScreen => (screenWidth <= AppitoBreakpoints.medium && screenWidth <= AppitoBreakpoints.large && !isSmallScreen);
  bool get isLargeScreen => (screenWidth <= AppitoBreakpoints.large && !isSmallScreen && !isMediumScreen);
}
