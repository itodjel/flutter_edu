enum AuthenticationStateStatus {
  checking,
  authenticated,
  unauthenticated,
}

class AuthenticationState {
  AuthenticationStateStatus status;

  AuthenticationState({required this.status});

  AuthenticationState copyWith({
    AuthenticationStateStatus? status,
  }) =>
      AuthenticationState(
        status: status ?? this.status,
      );
}
