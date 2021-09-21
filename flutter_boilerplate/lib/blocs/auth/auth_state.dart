enum AuthStateStatus {
  checkingAuthentication,
  checkedAuthentication,
  unAuthenticated,
  authenticated,
  authenticatedAsGuest,
}

class AuthState {
  AuthStateStatus status;

  AuthState({
    required this.status,
  });

  AuthState copyWith({
    AuthStateStatus? status,
  }) =>
      AuthState(
        status: status ?? this.status,
      );
}
