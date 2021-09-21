import 'package:flutter_boilerplate/_all.dart';

enum LocalizationStateStatus {
  initializing,
  initialized,
  changed,
}

class LocalizationState {
  LocalizationStateStatus status;
  Locale locale;

  LocalizationState({
    required this.status,
    required this.locale,
  });

  LocalizationState copyWith({
    LocalizationStateStatus? status,
    Locale? locale,
  }) =>
      LocalizationState(
        status: status ?? this.status,
        locale: locale ?? this.locale,
      );
}
