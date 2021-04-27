import 'package:flutter_boilerplate/all.dart';

enum ThemeStateStatus {
  loading,
  loaded,
}

class ThemeState {
  ThemeStateStatus status;
  ThemeMode themeMode;

  ThemeState({
    required this.status,
    required this.themeMode,
  });

  ThemeState copyWith({
    ThemeStateStatus? status,
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      status: status ?? this.status,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
