import 'package:flutter_boilerplate/_all.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthenticationRepository authenticationRepository;

  SignInBloc({
    required this.authenticationRepository,
  }) : super(initialState()) {
    on<SignInUpdateEvent>(_update);
    on<SignInValidateEvent>(_validate);
    on<SignInSubmitEvent>(_submit);
  }

  static SignInState initialState() => SignInState(
        status: SignInStateStatus.initial,
        model: SignInModel(),
        submittedOnce: false,
      );

  Future<void> _update(SignInUpdateEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: SignInStateStatus.initial, model: event.model));
  }

  Future<void> _validate(SignInValidateEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: SignInStateStatus.validating, submittedOnce: true));
  }

  Future<void> _submit(SignInSubmitEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: SignInStateStatus.submitting));
    await Future.delayed(const Duration(seconds: 5));

    //TODO: Ping your API via repository to authenticate the user
    final success = await authenticationRepository.signIn(state.model);

    if (success) {
      emit(state.copyWith(status: SignInStateStatus.submittingSuccess));
      emit(initialState());
    } else {
      emit(state.copyWith(status: SignInStateStatus.submittingError));
    }
  }
}
