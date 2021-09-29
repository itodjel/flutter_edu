import 'package:flutter_boilerplate/_all.dart';

abstract class SignInEvent {}

class SignInUpdateEvent extends SignInEvent {
  final SignInModel model;

  SignInUpdateEvent({required this.model});
}

class SignInSubmitEvent extends SignInEvent {}

class SignInValidateEvent extends SignInEvent {}
