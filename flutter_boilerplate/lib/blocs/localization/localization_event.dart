import 'dart:ui';

import 'package:meta/meta.dart';

abstract class LocalizationEvent {}

class LocalizationLoadEvent extends LocalizationEvent {}

class LocalizationChangeEvent extends LocalizationEvent {
  final Locale locale;

  LocalizationChangeEvent({
    required this.locale,
  }) : assert(locale != null);
}
