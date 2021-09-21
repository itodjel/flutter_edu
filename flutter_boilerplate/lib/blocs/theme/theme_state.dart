import 'package:flutter_boilerplate/_all.dart';

enum ThemeStateStatus {
  initializing,
  initialized,
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
