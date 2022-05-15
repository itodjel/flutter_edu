import 'package:appito/_all.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRequestModelValidator signInRequestModelValidator;
  final IAuthenticationRepository authenticationRepository;

  SignInBloc({
    required this.signInRequestModelValidator,
    required this.authenticationRepository,
  }) : super(SignInState.initial()) {
    on<SignInInitEvent>(_init);
    on<SignInUpdateEvent>(_update);
    on<SignInSubmitEvent>(_submit);
  }

  Future<void> _init(SignInInitEvent event, Emitter<SignInState> emit) async {
    emit(SignInState.initial().copyWith(status: SignInStateStatus.initialized));
  }

  Future<void> _update(SignInUpdateEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(model: event.model));
  }

  Future<void> _submit(SignInSubmitEvent event, Emitter<SignInState> emit) async {
    if (signInRequestModelValidator.validate(state.model)) {
      emit(state.copyWith(status: SignInStateStatus.submitting));

      final result = await authenticationRepository.signIn(state.model);

      if (result.isSuccess) {
        emit(state.copyWith(status: SignInStateStatus.submittingSuccess));
        add(SignInInitEvent());
      } else {
        emit(state.copyWith(status: SignInStateStatus.submittingError, autovalidate: true));
        emit(state.copyWith(status: SignInStateStatus.initialized));
      }
    } else {
      emit(state.copyWith(status: SignInStateStatus.validationError, autovalidate: true));
      emit(state.copyWith(status: SignInStateStatus.initialized));
    }
  }
}
