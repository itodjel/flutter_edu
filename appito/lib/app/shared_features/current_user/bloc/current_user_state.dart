import 'package:appito/_all.dart';

enum CurrentUserStateStatus {
  initializing,
  initialized,
  unInitialized,
}

class CurrentUserState {
  final CurrentUserStateStatus status;
  final AccountResponseModel? account;

  CurrentUserState({
    required this.status,
    this.account,
  });

  factory CurrentUserState.initial() => CurrentUserState(status: CurrentUserStateStatus.initializing);

  CurrentUserState copyWith({
    CurrentUserStateStatus? status,
    AccountResponseModel? account,
  }) {
    return CurrentUserState(
      status: status ?? this.status,
      account: account ?? this.account,
    );
  }
}
