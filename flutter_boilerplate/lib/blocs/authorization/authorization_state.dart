enum AuthorizationStateStatus {
  checking,
  authorized,
  unauthorized,
}

class AuthorizationState {
  AuthorizationStateStatus status;

  AuthorizationState({required this.status});

  AuthorizationState copyWith({
    AuthorizationStateStatus? status,
  }) =>
      AuthorizationState(
        status: status ?? this.status,
      );
}
