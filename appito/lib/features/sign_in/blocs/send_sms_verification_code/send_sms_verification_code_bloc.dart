import 'package:appito/_all.dart';

class SendSMSVerificationCodeBloc extends Bloc<SendSMSVerificationCodeEvent, SendSMSVerificationCodeState> {
  final SendSMSVerificationCodeRequestModelValidator sendSMSVerificationCodeRequestModelValidator;
  final IAuthenticationRepository authenticationRepository;

  SendSMSVerificationCodeBloc({
    required this.sendSMSVerificationCodeRequestModelValidator,
    required this.authenticationRepository,
  }) : super(SendSMSVerificationCodeState.initial()) {
    on<SendSMSVerificationCodeInitEvent>(_init);
    on<SendSMSVerificationCodeUpdateEvent>(_update);
    on<SendSMSVerificationCodeSubmitEvent>(_submit);
  }

  Future<void> _init(SendSMSVerificationCodeInitEvent event, Emitter<SendSMSVerificationCodeState> emit) async {
    emit(
      SendSMSVerificationCodeState.initial().copyWith(
        status: SendSMSVerificationCodeStateStatus.initialized,
        modelvalidator: sendSMSVerificationCodeRequestModelValidator,
      ),
    );
  }

  Future<void> _update(SendSMSVerificationCodeUpdateEvent event, Emitter<SendSMSVerificationCodeState> emit) async {
    emit(state.copyWith(model: event.model));
  }

  Future<void> _submit(SendSMSVerificationCodeSubmitEvent event, Emitter<SendSMSVerificationCodeState> emit) async {
    if (sendSMSVerificationCodeRequestModelValidator.validate(state.model)) {
      emit(state.copyWith(status: SendSMSVerificationCodeStateStatus.submitting));

      final result = await authenticationRepository.sendSMSVerificationCode(state.model);

      if (result.isSuccess) {
        emit(state.copyWith(status: SendSMSVerificationCodeStateStatus.submittingSuccess));
        add(SendSMSVerificationCodeInitEvent());
      } else {
        emit(state.copyWith(status: SendSMSVerificationCodeStateStatus.submittingError, autovalidate: true));
        emit(state.copyWith(status: SendSMSVerificationCodeStateStatus.initialized));
      }
    } else {
      emit(state.copyWith(status: SendSMSVerificationCodeStateStatus.validationError, autovalidate: true));
      emit(state.copyWith(status: SendSMSVerificationCodeStateStatus.initialized));
    }
  }
}
