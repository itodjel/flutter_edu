import 'package:appito/domain/models/authentication/requests/_all.dart';

abstract class SendSMSVerificationCodeEvent {}

class SendSMSVerificationCodeInitEvent extends SendSMSVerificationCodeEvent {}

class SendSMSVerificationCodeUpdateEvent extends SendSMSVerificationCodeEvent {
  final SendSMSVerificationCodeRequestModel model;

  SendSMSVerificationCodeUpdateEvent({required this.model});
}

class SendSMSVerificationCodeSubmitEvent extends SendSMSVerificationCodeEvent {}
