import 'dart:ui';

abstract class LocalizationEvent {}

class LocalizationLoadEvent extends LocalizationEvent {}

class LocalizationChangeEvent extends LocalizationEvent {
  final Locale locale;

  LocalizationChangeEvent({
    required this.locale,
  });
}
