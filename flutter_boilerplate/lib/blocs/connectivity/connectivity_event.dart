import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityEvent {}

class ConnectivityUpdateStatusEvent extends ConnectivityEvent {
  final ConnectivityResult status;

  ConnectivityUpdateStatusEvent({required this.status});
}
