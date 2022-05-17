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

    _introBlocSubscription = introBloc.stream.listen((introState) {
      if (introState.status == IntroStateStatus.finished) {
        add(AppNavigationCompleteStepEvent(status: AppNavigationStateStatus.intro));
      }
    });
    _localizationBlocSubscription = localizationBloc.stream.listen((localizationState) {
      if (localizationState.status == LocalizationStateStatus.initialized) {
        add(AppNavigationCompleteStepEvent(status: AppNavigationStateStatus.selectLanguage));
      }
    });
    _authBlocSubscription = authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.authenticated) {
        add(AppNavigationCompleteStepEvent(status: AppNavigationStateStatus.signIn));
      }
    });
  }

  Future<void> _completeStep(AppNavigationCompleteStepEvent event, Emitter<AppNavigationState> emit) async {
    switch (event.status) {
      case AppNavigationStateStatus.selectLanguage:
        emit(state.copyWith(status: AppNavigationStateStatus.intro));
        break;
      case AppNavigationStateStatus.intro:
        emit(state.copyWith(status: AppNavigationStateStatus.signIn));
        break;
      case AppNavigationStateStatus.signIn:
        emit(state.copyWith(status: AppNavigationStateStatus.home));
        break;
      case AppNavigationStateStatus.home:
        emit(state.copyWith(status: AppNavigationStateStatus.home));
        break;
    }
  }

  @override
  Future<void> close() {
    _introBlocSubscription.cancel();
    _localizationBlocSubscription.cancel();
    _authBlocSubscription.cancel();

    return super.close();
  }
}