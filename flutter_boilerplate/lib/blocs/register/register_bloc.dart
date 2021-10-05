import 'package:flutter_boilerplate/_all.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAccountRepository accountRepository;

  RegisterBloc({
    required this.accountRepository,
  }) : super(initialState());

  static RegisterState initialState() => RegisterState(
        status: RegisterStateStatus.initial,
        model: RegisterModel(),
        submittedOnce: false,
      );

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterUpdateEvent) {
      yield* _update(event);
    } else if (event is RegisterValidateEvent) {
      yield* _validate();
    } else if (event is RegisterSubmitEvent) {
      yield* _submit();
    }
  }

  Stream<RegisterState> _update(RegisterUpdateEvent event) async* {
    yield state.copyWith(status: RegisterStateStatus.initial, model: event.model);
  }

  Stream<RegisterState> _validate() async* {
    yield state.copyWith(status: RegisterStateStatus.validating, submittedOnce: true);
  }

  Stream<RegisterState> _submit() async* {
    yield state.copyWith(status: RegisterStateStatus.submitting);

    final success = await accountRepository.register(state.model);

    if (success) {
      //TODO: Maybe signIn automatically if no email confirmation is required
      //await authenticationRepository.signIn(SignInModel(userNameOrEmail: state.model.email, password: state.model.password));
      yield state.copyWith(status: RegisterStateStatus.submittingSuccess);
      yield initialState();
    } else {
      yield state.copyWith(status: RegisterStateStatus.submittingError);
    }
  }
}
