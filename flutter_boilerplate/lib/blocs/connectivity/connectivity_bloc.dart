import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_boilerplate/_all.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final AppSettings appSettings;
  late StreamSubscription<ConnectivityResult> _connectivityStatusSubscription;

  ConnectivityBloc({
    required this.appSettings,
  }) : super(initialState()) {
    _connectivityStatusSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult status) {
      add(ConnectivityUpdateStatusEvent(status: ConnectivityStateStatus.values[status.index]));
    });
  }

  static ConnectivityState initialState() => ConnectivityState(
        status: ConnectivityStateStatus.initializing,
      );

  @override
  Stream<ConnectivityState> mapEventToState(ConnectivityEvent event) async* {
    if (event is ConnectivityUpdateStatusEvent) {
      yield* _updateStatus(event);
    }
  }

  Stream<ConnectivityState> _updateStatus(ConnectivityUpdateStatusEvent event) async* {
    yield state.copyWith(status: event.status);
  }

  @override
  Future<void> close() {
    _connectivityStatusSubscription.cancel();
    return super.close();
  }
}
