import 'package:appito/_all.dart';

enum LocalizationStateStatus {
  initializing,
  initialized,
  initializedDefault,
  changed,
}

class LocalizationState {
  LocalizationStateStatus status;
  Locale locale;
  bool languagePreviouslySelected;

  LocalizationState({
    required this.status,
    required this.locale,
    this.languagePreviouslySelected = false,
  });

  LocalizationState copyWith({
    LocalizationStateStatus? status,
    Locale? locale,
    bool? languagePreviouslySelected,
  }) =>
      LocalizationState(
        status: status ?? this.status,
        locale: locale ?? this.locale,
        languagePreviouslySelected: languagePreviouslySelected ?? this.languagePreviouslySelected,
      );
}
