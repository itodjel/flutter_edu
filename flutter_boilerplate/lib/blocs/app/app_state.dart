import 'package:flutter_boilerplate/_all.dart';

enum AppStateStatus {
  loading,
  loaded,
  requiresUpdate,
}

enum AppRequirement {
  auth,
  theme,
  // location,
  localization,
  // connectivity,
  configuration,
}

class AppState {
  AppStateStatus status;
  List<AppRequirement> requirements;
  int get completedSteps => requirements.length;
  int get totalSteps => AppRequirement.values.length;
  double get quotient => completedSteps / totalSteps.valueForDividend;
  double get completedPercentage => quotient * 100;

  AppState({
    required this.status,
    required this.requirements,
  });

  AppState copyWith({
    AppStateStatus? status,
    List<AppRequirement>? requirements,
  }) =>
      AppState(
        status: status ?? this.status,
        requirements: requirements ?? this.requirements,
      );
}
