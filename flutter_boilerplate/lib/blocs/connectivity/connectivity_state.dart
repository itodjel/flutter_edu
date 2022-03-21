import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityState {
  ConnectivityResult status;
  bool get isConnected => status != ConnectivityResult.none;

  ConnectivityState({
    required this.status,
  });

  ConnectivityState copyWith({
    ConnectivityResult? status,
  }) =>
      ConnectivityState(
        status: status ?? this.status,
      );
}
