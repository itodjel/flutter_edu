import 'package:flutter_boilerplate/_all.dart';
import 'package:tailgreeter/blocs/_all.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final IAccountRepository accountRepository;

  ResetPasswordBloc({
    required this.accountRepository,
  }) : super(initialState());

  static ResetPasswordState initialState() => ResetPasswordState(
        status: ResetPasswordStateStatus.initial,
        model: ResetPasswordModel(),
        submittedOnce: false,
      );

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {
    if (event is ResetPasswordValidateEvent) {
      yield* _validate();
    } else if (event is ResetPasswordUpdateEvent) {
      yield* _update(event);
    } else if (event is ResetPasswordSubmitEmailEvent) {
      yield* _submitEmail();
    } else if (event is ResetPasswordSubmitEvent) {
      yield* _submit();
    } else if (event is ResetPasswordEmailValidateEvent) {
      yield* _validateEmail();
    }
  }

  Stream<ResetPasswordState> _validateEmail() async* {
    yield state.copyWith(status: ResetPasswordStateStatus.validatingEmail);
  }

  Stream<ResetPasswordState> _validate() async* {
    yield state.copyWith(status: ResetPasswordStateStatus.validating, submittedOnce: true);
  }

  Stream<ResetPasswordState> _update(ResetPasswordUpdateEvent event) async* {
    yield state.copyWith(model: event.model, status: ResetPasswordStateStatus.initial);
  }

  Stream<ResetPasswordState> _submitEmail() async* {
    yield state.copyWith(status: ResetPasswordStateStatus.emailSubmitting);

    final result = await accountRepository.resetPassword(state.model.email.value);

    if (result) {
      yield state.copyWith(status: ResetPasswordStateStatus.emailSubmittingSuccess);
    } else {
      yield state.copyWith(status: ResetPasswordStateStatus.emailSubmittingError);
    }
  }

  Stream<ResetPasswordState> _submit() async* {
    yield state.copyWith(status: ResetPasswordStateStatus.submitting);

    final result = await accountRepository.resetPasswordConfirm(state.model.email.value, state.model.newPassword.value, state.model.code.value);

    if (result) {
      yield state.copyWith(status: ResetPasswordStateStatus.submittingSuccess);
      yield initialState();
    } else {
      yield state.copyWith(status: ResetPasswordStateStatus.submittingError);
    }
  }
}
