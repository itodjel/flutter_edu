import 'package:flutter_boilerplate/_all.dart';

abstract class RegisterEvent {}

class RegisterUpdateEvent extends RegisterEvent {
  final RegisterModel model;

  RegisterUpdateEvent({required this.model});
}

class RegisterSubmitEvent extends RegisterEvent {}

class RegisterValidateEvent extends RegisterEvent {}
