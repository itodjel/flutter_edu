import 'package:appito/_all.dart';

class ExternalSignInBloc extends Bloc<ExternalSignInEvent, ExternalSignInState> {
  final IAuthenticationRepository authenticationRepository;

  ExternalSignInBloc({
    required this.authenticationRepository,
  }) : super(ExternalSignInState.initial()) {
    on<ExternalSignInInitEvent>(_init);
    on<ExternalSignInSubmitEvent>(_submit);
  }

  Future<void> _init(ExternalSignInInitEvent event, Emitter<ExternalSignInState> emit) async {
    emit(
      ExternalSignInState.initial().copyWith(
        status: ExternalSignInStateStatus.initialized,
        signInProvider: event.signInProvider,
      ),
    );
  }

  Future<void> _submit(ExternalSignInSubmitEvent event, Emitter<ExternalSignInState> emit) async {
    emit(state.copyWith(status: ExternalSignInStateStatus.submitting));

    final result = await authenticationRepository.signInWithExternalProvider(state.signInProvider);

    if (result.isSuccess) {
      emit(state.copyWith(status: ExternalSignInStateStatus.submittingSuccess));
      add(ExternalSignInInitEvent(signInProvider: state.signInProvider));
    } else {
      emit(state.copyWith(status: ExternalSignInStateStatus.submittingError));
      emit(state.copyWith(status: ExternalSignInStateStatus.initialized));
    }
  }
}
