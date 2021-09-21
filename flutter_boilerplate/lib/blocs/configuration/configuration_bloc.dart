import 'package:tailgreeter/_all.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IAccountRepository accountRepository;
  late StreamSubscription _locationBlocSubscription;
  late StreamSubscription _authBlocSubscription;

  ConfigurationBloc({
    required AuthBloc authBloc,
    required LocationBloc locationBloc,
    required this.accountRepository,
  }) : super(_initialState()) {
    _locationBlocSubscription = locationBloc.stream.listen((locationState) {
      add(ConfigurationInitEvent());
    });
    _authBlocSubscription = authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.authenticated || authState.status == AuthStateStatus.unAuthenticated) {
        add(ConfigurationInitEvent());
      }
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

    final configuration = await accountRepository.getConfiguration();

    yield state.copyWith(status: ConfigurationStateStatus.initialized, configuration: configuration);
  }

  @override
  Future<void> close() {
    _locationBlocSubscription.cancel();
    _authBlocSubscription.cancel();
    return super.close();
  }
}
