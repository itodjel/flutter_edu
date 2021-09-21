import 'package:flutter_boilerplate/_all.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(initialState());

  static LoginState initialState() => LoginState(
        status: LoginStateStatus.initial,
        model: LoginModel(),
        submittedOnce: false,
      );

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInitEvent) {
      yield* _init();
    } else if (event is LoginUpdateEvent) {
      yield* _update(event);
    } else if (event is LoginValidateEvent) {
      yield* _validate();
    } else if (event is LoginSubmitEvent) {
      yield* _submit();
    }
  }

  Stream<LoginState> _init() async* {
    yield initialState();
  }

  Stream<LoginState> _update(LoginUpdateEvent event) async* {
    yield state.copyWith(status: LoginStateStatus.initial, model: event.model);
  }

  Stream<LoginState> _validate() async* {
    yield state.copyWith(status: LoginStateStatus.validating, submittedOnce: true);
  }

  Stream<LoginState> _submit() async* {
    yield state.copyWith(status: LoginStateStatus.submitting);
    await Future.delayed(const Duration(seconds: 5));

    //TODO: Ping your API via repository to authenticate the user
    final success = true; //await authenticationRepository.login(state.model);

    if (success) {
      yield state.copyWith(status: LoginStateStatus.submittingSuccess);
      yield initialState();
    } else {
      yield state.copyWith(status: LoginStateStatus.submittingError);
    }
  }
}
