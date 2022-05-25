import 'package:appito/_all.dart';

enum SendSMSVerificationCodeStateStatus {
  initializing,
  initialized,
  submitting,
  submittingSuccess,
  submittingError,
  validationError,
}

class SendSMSVerificationCodeState {
  final SendSMSVerificationCodeStateStatus status;
  final SendSMSVerificationCodeRequestModel model;
  SendSMSVerificationCodeRequestModelValidator? modelvalidator;
  bool autovalidate;

  SendSMSVerificationCodeState({
    required this.status,
    required this.model,
    this.modelvalidator,
    this.autovalidate = false,
  });

  factory SendSMSVerificationCodeState.initial() => SendSMSVerificationCodeState(
        status: SendSMSVerificationCodeStateStatus.initializing,
        model: SendSMSVerificationCodeRequestModel(),
      );

  SendSMSVerificationCodeState copyWith({
    SendSMSVerificationCodeStateStatus? status,
    SendSMSVerificationCodeRequestModel? model,
    SendSMSVerificationCodeRequestModelValidator? modelvalidator,
    bool? autovalidate,
  }) =>
      SendSMSVerificationCodeState(
        status: status ?? this.status,
        model: model ?? this.model,
        modelvalidator: modelvalidator ?? this.modelvalidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
