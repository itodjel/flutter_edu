import 'dart:math';

// Keep this order the way you want app navigation to
// step through initialization process
enum AppNavigationStep {
  selectLanguage,
  intro,
  signIn,
  home,
}

class AppNavigationState {
  List<AppNavigationStep> steps;
  AppNavigationStep get currentStep => AppNavigationStep.values[steps.map((x) => x.index).reduce(min)];

  AppNavigationState({required this.steps});

  factory AppNavigationState.initial() => AppNavigationState(steps: List.from(AppNavigationStep.values));

  AppNavigationState copyWith({
    List<AppNavigationStep>? steps,
  }) {
    return AppNavigationState(
      steps: steps ?? this.steps,
    );
  }
}
