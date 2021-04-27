import 'package:flutter_boilerplate/all.dart';

enum LocalizationStateStatus {
  loading,
  loaded,
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
