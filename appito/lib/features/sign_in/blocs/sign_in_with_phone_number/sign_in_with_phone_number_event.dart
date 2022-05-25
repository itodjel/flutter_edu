import 'package:appito/domain/models/authentication/requests/_all.dart';

abstract class SignInWithPhoneNumberEvent {}

class SignInWithPhoneNumberInitEvent extends SignInWithPhoneNumberEvent {
  final String phoneNumber;

  SignInWithPhoneNumberInitEvent({required this.phoneNumber});
}

class SignInWithPhoneNumberUpdateEvent extends SignInWithPhoneNumberEvent {
  final SignInWithPhoneNumberRequestModel model;

  SignInWithPhoneNumberUpdateEvent({required this.model});
}

class SignInWithPhoneNumberSubmitEvent extends SignInWithPhoneNumberEvent {}
