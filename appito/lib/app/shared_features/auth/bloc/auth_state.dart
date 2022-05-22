enum AuthStateStatus {
  initializing,
  authenticated,
  unAuthenticated,
  refreshedSignIn,
  signedOut,
}

class AuthState {
  final AuthStateStatus status;

  AuthState({required this.status});

  factory AuthState.initial() => AuthState(status: AuthStateStatus.initializing);

  AuthState copyWith({
    AuthStateStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }
}
