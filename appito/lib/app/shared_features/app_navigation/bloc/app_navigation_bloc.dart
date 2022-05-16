import 'package:appito/_all.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  late StreamSubscription _authBlocSubscription;
  late StreamSubscription _localizationBlocSubscription;

  AppNavigationBloc({
    required AuthBloc authBloc,
    required LocalizationBloc localizationBloc,
  }) : super(AppNavigationState.initial()) {
    on<AppNavigationCompleteStepEvent>(_completeStep);

    _authBlocSubscription = authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.authenticated) {
        add(AppNavigationCompleteStepEvent(status: AppNavigationStateStatus.signIn));
      }
    });
    _localizationBlocSubscription = localizationBloc.stream.listen((localizationState) {
      if (localizationState.status == LocalizationStateStatus.initialized) {
        add(AppNavigationCompleteStepEvent(status: AppNavigationStateStatus.selectLanguage));
      }
    });
  }

  Future<void> _completeStep(AppNavigationCompleteStepEvent event, Emitter<AppNavigationState> emit) async {
    switch (event.status) {
      case AppNavigationStateStatus.selectLanguage:
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
    _authBlocSubscription.cancel();
    _localizationBlocSubscription.cancel();

    return super.close();
  }
}
