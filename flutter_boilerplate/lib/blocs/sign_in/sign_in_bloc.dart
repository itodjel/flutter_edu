import 'package:flutter_boilerplate/_all.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthenticationRepository authenticationRepository;

  SignInBloc({
    required this.authenticationRepository,
  }) : super(initialState());

  static SignInState initialState() => SignInState(
        status: SignInStateStatus.initial,
        model: SignInModel(),
        submittedOnce: false,
      );

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInUpdateEvent) {
      yield* _update(event);
    } else if (event is SignInValidateEvent) {
      yield* _validate();
    } else if (event is SignInSubmitEvent) {
      yield* _submit();
    }
  }

  Stream<SignInState> _update(SignInUpdateEvent event) async* {
    yield state.copyWith(status: SignInStateStatus.initial, model: event.model);
  }

  Stream<SignInState> _validate() async* {
    yield state.copyWith(status: SignInStateStatus.validating, submittedOnce: true);
  }

  Stream<SignInState> _submit() async* {
    yield state.copyWith(status: SignInStateStatus.submitting);
    await Future.delayed(const Duration(seconds: 5));

    //TODO: Ping your API via repository to authenticate the user
    final success = await authenticationRepository.signIn(state.model);

    if (success) {
      yield state.copyWith(status: SignInStateStatus.submittingSuccess);
      yield initialState();
    } else {
      yield state.copyWith(status: SignInStateStatus.submittingError);
    }
  }
}
