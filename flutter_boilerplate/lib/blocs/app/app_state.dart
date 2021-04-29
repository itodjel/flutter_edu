import 'package:flutter_boilerplate/all.dart';

enum AppStateStatus {
  loading,
  loaded,
  requiresUpdate,
}

class AppState {
  AppStateStatus status;
  int completedSteps;
  int totalSteps;
  double get completedPercentage => (completedSteps / totalSteps.valueForDividend) * 100;

  AppState({
    required this.status,
    required this.completedSteps,
    required this.totalSteps,
  });

  AppState copyWith({
    AppStateStatus? status,
    int? completedSteps,
    int? totalSteps,
  }) =>
      AppState(
        status: status ?? this.status,
        completedSteps: completedSteps ?? this.completedSteps,
        totalSteps: totalSteps ?? this.totalSteps,
      );
}
