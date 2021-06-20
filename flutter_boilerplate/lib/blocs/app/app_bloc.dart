import 'package:flutter_boilerplate/all.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppSettings appSettings;

  AppBloc({
    required ThemeBloc themeBloc,
    required LocalizationBloc localizationBloc,
    required this.appSettings,
  }) : super(initialState()) {
    themeBloc.stream.listen((state) {
      if (state.status == ThemeStateStatus.loaded) {
        add(AppCompleteStepEvent());
      }
    });
    localizationBloc.stream.listen((state) {
      if (state.status == LocalizationStateStatus.loaded) {
        add(AppCompleteStepEvent());
      }
    });
  }

  static AppState initialState() => AppState(
        status: AppStateStatus.loading,
        completedSteps: 0,
        //totalSteps is equal to number of distributed application actions that need to be
        //performed for the app to be fully operational, currently in the constructor can
        //be found 2 of these actions
        totalSteps: 2,
      );

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppSetupEvent) {
      yield* _setup();
    } else if (event is AppCompleteStepEvent) {
      yield* _completeStep();
    }
  }

  Stream<AppState> _setup() async* {
    yield state.copyWith(status: AppStateStatus.loading);
    //Currently there are no explicit actions in the _setup method
    //but it can be extended for maybe loading configuration of latest api version
  }

  Stream<AppState> _completeStep() async* {
    final completedSteps = state.completedSteps + 1;

    yield state.copyWith(
      status: completedSteps >= state.totalSteps ? AppStateStatus.loaded : AppStateStatus.loading,
      completedSteps: completedSteps,
      totalSteps: state.totalSteps,
    );
  }
}
