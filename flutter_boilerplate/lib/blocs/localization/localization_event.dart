import 'dart:ui';

abstract class LocalizationEvent {}

class LocalizationInitEvent extends LocalizationEvent {}

class LocalizationChangeEvent extends LocalizationEvent {
  final Locale locale;

  LocalizationChangeEvent({
    required this.locale,
  });
}
