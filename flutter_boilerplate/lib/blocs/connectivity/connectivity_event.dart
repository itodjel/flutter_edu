import 'package:tailgreeter/blocs/connectivity/connectivity_state.dart';

abstract class ConnectivityEvent {}

class ConnectivityInitEvent extends ConnectivityEvent {}

class ConnectivityUpdateStatusEvent extends ConnectivityEvent {
  final ConnectivityStateStatus status;

  ConnectivityUpdateStatusEvent({required this.status});
}
