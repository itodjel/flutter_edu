import 'package:appito/_all.dart';

class SendVerificationCodeState extends AbstractFormState<SendVerificationCodeRequestModel, SendVerificationCodeRequestModelValidator> {
  SendVerificationCodeState({
    required super.formResultStatus,
    super.model,
    super.modelValidator,
    super.autovalidate,
  });

  factory SendVerificationCodeState.initial() => SendVerificationCodeState(formResultStatus: FormResultStatus.initializing);

  @override
  SendVerificationCodeState copyWith({
    FormResultStatus? formResultStatus,
    SendVerificationCodeRequestModel? model,
    SendVerificationCodeRequestModelValidator? modelValidator,
    bool? autovalidate,
  }) =>
      SendVerificationCodeState(
        formResultStatus: formResultStatus ?? this.formResultStatus,
        model: model ?? this.model,
        modelValidator: modelValidator ?? this.modelValidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
