import 'package:flutter_boilerplate/_all.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInModelValidator modelValidator;
  final IAuthenticationRepository authenticationRepository;

  SignInBloc({
    required this.modelValidator,
    required this.authenticationRepository,
  }) : super(initialState(modelValidator));

  static SignInState initialState(SignInModelValidator modelValidator) => SignInState(
        status: SignInStateStatus.initial,
        model: SignInModel(),
        modelValidator: modelValidator,
        submittedOnce: false,
      );

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInUpdateEvent) {
      yield* _update(event);
    } else if (event is SignInSubmitEvent) {
      yield* _submit();
    }
  }

  Stream<SignInState> _update(SignInUpdateEvent event) async* {
    yield state.copyWith(status: SignInStateStatus.initial, model: event.model);
  }

  Stream<SignInState> _submit() async* {
    if (modelValidator.validate(state.model)) {
      yield state.copyWith(status: SignInStateStatus.submitting);
      await Future.delayed(const Duration(seconds: 5));

      final success = await authenticationRepository.signIn(state.model);

      if (success) {
        yield state.copyWith(status: SignInStateStatus.submittingSuccess);
        yield initialState(modelValidator);
      } else {
        yield state.copyWith(status: SignInStateStatus.submittingError);
      }
    } else {
      yield state.copyWith(status: SignInStateStatus.validating, submittedOnce: true);
    }
  }
}
