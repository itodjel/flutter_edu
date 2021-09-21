import 'package:flutter_boilerplate/_all.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  late StreamSubscription _authBlocSubscription;
  late StreamSubscription _locationBlocSubscription;

  ConfigurationBloc({
    required AuthBloc authBloc,
    required LocationBloc locationBloc,
  }) : super(_initialState()) {
    _authBlocSubscription = authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.authenticated || authState.status == AuthStateStatus.unAuthenticated) {
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

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is ConfigurationInitEvent) {
      yield* _init();
    }
  }

  Stream<ConfigurationState> _init() async* {
    yield state.copyWith(status: ConfigurationStateStatus.initializing);

    //TODO: Load real configuration for local storage or from API
    final configuration = Configuration(); //await accountRepository.getConfiguration();

    yield state.copyWith(status: ConfigurationStateStatus.initialized, configuration: configuration);
  }

  @override
  Future<void> close() {
    _locationBlocSubscription.cancel();
    _authBlocSubscription.cancel();

    return super.close();
  }
}
