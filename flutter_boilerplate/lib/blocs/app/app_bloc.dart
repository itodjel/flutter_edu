import 'dart:developer';

import 'package:flutter_boilerplate/_all.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppSettings appSettings;
  late StreamSubscription _authBlocSubscription;
  late StreamSubscription _themeBlocSubscription;
  late StreamSubscription _locationBlocSubscription;
  late StreamSubscription _localizationBlocSubscription;
  late StreamSubscription _connectivityBlocSubscription;
  late StreamSubscription _configurationBlocSubscription;

  AppBloc({
    required this.appSettings,
    required AuthBloc authBloc,
    required ThemeBloc themeBloc,
    required LocationBloc locationBloc,
    required LocalizationBloc localizationBloc,
    required ConnectivityBloc connectivityBloc,
    required ConfigurationBloc configurationBloc,
  }) : super(initialState()) {
    _authBlocSubscription = authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.checkedAuthentication) {
        add(AppCompleteStepEvent(requirement: AppRequirement.auth));
        _authBlocSubscription.cancel();
      }
    });
    _themeBlocSubscription = themeBloc.stream.listen((themeState) {
      if (themeState.status == ThemeStateStatus.initialized) {
        add(AppCompleteStepEvent(requirement: AppRequirement.theme));
        _themeBlocSubscription.cancel();
      }
    });
    _locationBlocSubscription = locationBloc.stream.listen((locationState) {
      if (locationState.status != LocationStateStatus.checking) {
        // add(AppCompleteStepEvent(requirement: AppRequirement.location));
        _locationBlocSubscription.cancel();
      }
    });
    _localizationBlocSubscription = localizationBloc.stream.listen((localizationState) {
      if (localizationState.status == LocalizationStateStatus.initialized) {
        add(AppCompleteStepEvent(requirement: AppRequirement.localization));
        _localizationBlocSubscription.cancel();
      }
    });
    _connectivityBlocSubscription = connectivityBloc.stream.listen((connectivityState) {
      if (connectivityState.status != ConnectivityStateStatus.initializing) {
        // add(AppCompleteStepEvent(requirement: AppRequirement.connectivity));
        _connectivityBlocSubscription.cancel();
      }
    });
    _configurationBlocSubscription = configurationBloc.stream.listen((configurationState) {
      if (configurationState.status == ConfigurationStateStatus.initialized) {
        add(AppCompleteStepEvent(requirement: AppRequirement.configuration));
        _configurationBlocSubscription.cancel();
      }
    });
    if (environment.isDevelopment) {
      _initializationStart = DateTime.now();
    }
  }

  static AppState initialState() => AppState(status: AppStateStatus.loading, requirements: []);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppCompleteStepEvent) {
      yield* _completeStep(event);
    }
  }

  Stream<AppState> _completeStep(AppCompleteStepEvent event) async* {
    final alreadyInitialized = state.requirements.contains(event.requirement);

    if (!alreadyInitialized) {
      if (environment.isDevelopment) {
        log(_formatInitializedMessage(event.requirement.toString()));
      }
      state.requirements.add(event.requirement);

      final finished = state.completedSteps >= state.totalSteps;

      if (!finished) {
        await Future.delayed(const Duration(milliseconds: 100));
        yield state.copyWith(status: AppStateStatus.loading);
      } else {
        yield state.copyWith(status: AppStateStatus.loading);
        await Future.delayed(const Duration(milliseconds: 100));
        yield state.copyWith(status: AppStateStatus.loaded);
      }
    }
  }

  late DateTime _initializationStart;
  String get _checkpoint => '{${DateTime.now().difference(_initializationStart).inMilliseconds} miliseconds}';
  String _formatInitializedMessage(String text) => '::: ${'$_checkpoint initialized $text'.padRight(85).padLeft(110)} :::';
}
