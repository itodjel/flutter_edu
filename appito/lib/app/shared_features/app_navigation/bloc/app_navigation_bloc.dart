import 'package:appito/_all.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  late StreamSubscription _introBlocSubscription;
  late StreamSubscription _localizationBlocSubscription;
  late StreamSubscription _authBlocSubscription;

  AppNavigationBloc({
    required IntroBloc introBloc,
    required LocalizationBloc localizationBloc,
    required AuthBloc authBloc,
  }) : super(AppNavigationState.initial()) {
    on<AppNavigationCompleteStepEvent>(_completeStep);
    on<AppNavigationRevertStepEvent>(_revertStep);

    _introBlocSubscription = introBloc.stream.listen((introState) {
      if (introState.status == IntroStateStatus.finished) {
        add(AppNavigationCompleteStepEvent(step: AppNavigationStep.intro));
      }
    });
    _localizationBlocSubscription = localizationBloc.stream.listen((localizationState) {
      if (localizationState.status == LocalizationStateStatus.initialized) {
        add(AppNavigationCompleteStepEvent(step: AppNavigationStep.selectLanguage));
      }
    });
    _authBlocSubscription = authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.authenticated) {
        add(AppNavigationCompleteStepEvent(step: AppNavigationStep.signIn));
      }
      if (authState.status == AuthStateStatus.signedOut) {
        add(AppNavigationRevertStepEvent(step: AppNavigationStep.signIn));
      }
    });
  }

  Future<void> _completeStep(AppNavigationCompleteStepEvent event, Emitter<AppNavigationState> emit) async {
    emit(state.copyWith(steps: state.steps.removeThen(event.step)));
  }

  Future<void> _revertStep(AppNavigationRevertStepEvent event, Emitter<AppNavigationState> emit) async {
    emit(state.copyWith(steps: state.steps.addThen(event.step)));
  }

  @override
  Future<void> close() {
    _introBlocSubscription.cancel();
    _localizationBlocSubscription.cancel();
    _authBlocSubscription.cancel();

    return super.close();
  }
}
