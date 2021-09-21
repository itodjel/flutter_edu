enum ConnectivityStateStatus {
  wifi,
  mobile,
  none,
  initializing,
}

class ConnectivityState {
  ConnectivityStateStatus status;

  ConnectivityState({
    required this.status,
  });

  ConnectivityState copyWith({
    ConnectivityStateStatus? status,
  }) =>
      ConnectivityState(
        status: status ?? this.status,
      );
}
