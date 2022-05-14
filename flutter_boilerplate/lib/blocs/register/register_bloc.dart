import 'package:flutter_boilerplate/_all.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAccountRepository accountRepository;

  RegisterBloc({
    required this.accountRepository,
  }) : super(initialState()) {
    on<RegisterUpdateEvent>(_update);
    on<RegisterValidateEvent>(_validate);
    on<RegisterSubmitEvent>(_submit);
  }

  static RegisterState initialState() => RegisterState(
        status: RegisterStateStatus.initial,
        model: RegisterModel(),
        submittedOnce: false,
      );

  Future<void> _update(RegisterUpdateEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStateStatus.initial, model: event.model));
  }

  Future<void> _validate(RegisterValidateEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStateStatus.validating, submittedOnce: true));
  }

  Future<void> _submit(RegisterSubmitEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStateStatus.submitting));

    final success = await accountRepository.register(state.model);

    if (success) {
      //TODO: Maybe signIn automatically if no email confirmation is required
      //await authenticationRepository.signIn(SignInModel(userNameOrEmail: state.model.email, password: state.model.password));
      emit(state.copyWith(status: RegisterStateStatus.submittingSuccess));
      emit(initialState());
    } else {
      emit(state.copyWith(status: RegisterStateStatus.submittingError));
    }
  }
}
