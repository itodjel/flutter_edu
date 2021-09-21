import 'package:flutter_boilerplate/_all.dart';

abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class LoginUpdateEvent extends LoginEvent {
  final LoginModel model;

  LoginUpdateEvent({required this.model});
}

class LoginSubmitEvent extends LoginEvent {}

class LoginValidateEvent extends LoginEvent {}
