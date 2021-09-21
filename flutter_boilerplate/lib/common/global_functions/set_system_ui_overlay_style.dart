import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/_all.dart';

void setSystemUIOverlayStyle({
  Color? systemNavigationBarColor,
  Color? statusBarColor,
  Brightness? statusBarBrightness,
  Brightness? statusBarIconBrightness,
  Brightness? systemNavigationBarIconBrightness,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: systemNavigationBarColor ?? AppTheme.light.theme.primaryColor,
      statusBarColor: statusBarColor ?? AppTheme.light.theme.primaryColor,
      statusBarBrightness: statusBarBrightness ?? Brightness.light,
      statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
      systemNavigationBarIconBrightness: systemNavigationBarIconBrightness ?? Brightness.light,
    ),
  );
}
