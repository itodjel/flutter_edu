import 'package:flutter_boilerplate/_all.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  late StreamSubscription _authenticationBlocSubscription;
  late StreamSubscription _locationBlocSubscription;

  ConfigurationBloc({
    required AuthenticationBloc authenticationBloc,
    required LocationBloc locationBloc,
  }) : super(_initialState()) {
    on<ConfigurationInitEvent>(_init);

    _authenticationBlocSubscription = authenticationBloc.stream.listen((authState) {
      if (authState.status == AuthenticationStateStatus.authenticated || authState.status == AuthenticationStateStatus.unauthenticated) {
        add(ConfigurationInitEvent());
      }
    });
    _locationBlocSubscription = locationBloc.stream.listen((locationState) {
      add(ConfigurationInitEvent());
    });
  }

  static ConfigurationState _initialState() => ConfigurationState(
        status: ConfigurationStateStatus.initializing,
        configuration: Configuration(),
      );

  Future<void> _init(ConfigurationInitEvent event, Emitter<ConfigurationState> emit) async {
    emit(state.copyWith(status: ConfigurationStateStatus.initializing));

    //TODO: Load real configuration for local storage or from API
    final configuration = Configuration(); //await accountRepository.getConfiguration();

    emit(state.copyWith(status: ConfigurationStateStatus.initialized, configuration: configuration));
  }

  @override
  Future<void> close() {
    _locationBlocSubscription.cancel();
    _authenticationBlocSubscription.cancel();

    return super.close();
  }
}
