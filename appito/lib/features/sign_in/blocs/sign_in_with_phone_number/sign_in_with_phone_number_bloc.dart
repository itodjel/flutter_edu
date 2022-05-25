import 'package:appito/_all.dart';

class SignInWithPhoneNumberBloc extends Bloc<SignInWithPhoneNumberEvent, SignInWithPhoneNumberState> {
  final SignInWithPhoneNumberRequestModelValidator signInWithPhoneNumberRequestModelValidator;
  final IAuthenticationRepository authenticationRepository;

  SignInWithPhoneNumberBloc({
    required this.signInWithPhoneNumberRequestModelValidator,
    required this.authenticationRepository,
  }) : super(SignInWithPhoneNumberState.initial()) {
    on<SignInWithPhoneNumberInitEvent>(_init);
    on<SignInWithPhoneNumberUpdateEvent>(_update);
    on<SignInWithPhoneNumberSubmitEvent>(_submit);
  }

  Future<void> _init(SignInWithPhoneNumberInitEvent event, Emitter<SignInWithPhoneNumberState> emit) async {
    emit(
      SignInWithPhoneNumberState.initial().copyWith(
        status: SignInWithPhoneNumberStateStatus.initialized,
        model: SignInWithPhoneNumberState.initial().model.copyWith(phoneNumber: event.phoneNumber),
        modelvalidator: signInWithPhoneNumberRequestModelValidator,
      ),
    );
  }

  Future<void> _update(SignInWithPhoneNumberUpdateEvent event, Emitter<SignInWithPhoneNumberState> emit) async {
    emit(state.copyWith(model: event.model));
  }

  Future<void> _submit(SignInWithPhoneNumberSubmitEvent event, Emitter<SignInWithPhoneNumberState> emit) async {
    if (signInWithPhoneNumberRequestModelValidator.validate(state.model)) {
      emit(state.copyWith(status: SignInWithPhoneNumberStateStatus.submitting));

      final result = await authenticationRepository.signInWithPhoneNumber(state.model);

      if (result.isSuccess) {
        emit(state.copyWith(status: SignInWithPhoneNumberStateStatus.submittingSuccess));
        emit(SignInWithPhoneNumberState.initial());
      } else {
        emit(state.copyWith(status: SignInWithPhoneNumberStateStatus.submittingError, autovalidate: true));
        emit(state.copyWith(status: SignInWithPhoneNumberStateStatus.initialized));
      }
    } else {
      emit(state.copyWith(status: SignInWithPhoneNumberStateStatus.validationError, autovalidate: true));
      emit(state.copyWith(status: SignInWithPhoneNumberStateStatus.initialized));
    }
  }
}
