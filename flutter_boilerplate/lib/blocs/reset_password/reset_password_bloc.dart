import 'package:flutter_boilerplate/_all.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(initialState()) {
    on<ResetPasswordValidateEvent>(_validate);
    on<ResetPasswordUpdateEvent>(_update);
    on<ResetPasswordSubmitEmailEvent>(_submitEmail);
    on<ResetPasswordSubmitEvent>(_submit);
    on<ResetPasswordValidateEmailEvent>(_validateEmail);
  }

  static ResetPasswordState initialState() => ResetPasswordState(
        status: ResetPasswordStateStatus.initial,
        model: ResetPasswordModel(),
        submittedOnce: false,
      );

  Future<void> _validateEmail(ResetPasswordValidateEmailEvent event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(status: ResetPasswordStateStatus.validatingEmail));
  }

  Future<void> _validate(ResetPasswordValidateEvent event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(status: ResetPasswordStateStatus.validating, submittedOnce: true));
  }

  Future<void> _update(ResetPasswordUpdateEvent event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(model: event.model, status: ResetPasswordStateStatus.initial));
  }

  Future<void> _submitEmail(ResetPasswordSubmitEmailEvent event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(status: ResetPasswordStateStatus.emailSubmitting));

    //TODO: Submit to your API
    final success = true; //await accountRepository.resetPassword(state.model.email.value);

    if (success) {
      emit(state.copyWith(status: ResetPasswordStateStatus.emailSubmittingSuccess));
    } else {
      emit(state.copyWith(status: ResetPasswordStateStatus.emailSubmittingError));
    }
  }

  Future<void> _submit(ResetPasswordSubmitEvent event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(status: ResetPasswordStateStatus.submitting));

    //TODO: Submit to your API
    final success = true; //await accountRepository.resetPasswordConfirm(state.model.email.value, state.model.newPassword.value, state.model.code.value);

    if (success) {
      emit(state.copyWith(status: ResetPasswordStateStatus.submittingSuccess));
      emit(initialState());
    } else {
      emit(state.copyWith(status: ResetPasswordStateStatus.submittingError));
    }
  }
}
