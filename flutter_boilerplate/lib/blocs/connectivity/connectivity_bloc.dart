import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_boilerplate/_all.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final AppSettings appSettings;
  late StreamSubscription<ConnectivityResult> _connectivityStatusSubscription;

  ConnectivityBloc({
    required this.appSettings,
  }) : super(initialState()) {
    on<ConnectivityUpdateStatusEvent>(_updateStatus);

    _connectivityStatusSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult status) {
      add(ConnectivityUpdateStatusEvent(status: status));
    });
  }

  static ConnectivityState initialState() => ConnectivityState(
        status: ConnectivityResult.none,
      );

  Future<void> _updateStatus(ConnectivityUpdateStatusEvent event, Emitter<ConnectivityState> emit) async {
    emit(state.copyWith(status: event.status));
  }

  @override
  Future<void> close() {
    _connectivityStatusSubscription.cancel();
    return super.close();
  }
}
