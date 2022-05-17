enum AppNavigationStateStatus {
  selectLanguage,
  intro,
  signIn,
  home,
}

class AppNavigationState {
  final AppNavigationStateStatus status;

  AppNavigationState({required this.status});

  factory AppNavigationState.initial() => AppNavigationState(status: AppNavigationStateStatus.selectLanguage);

  AppNavigationState copyWith({
    AppNavigationStateStatus? status,
  }) {
    return AppNavigationState(
      status: status ?? this.status,
    );
  }
}
