import 'package:flutter_boilerplate/_all.dart';

abstract class ResetPasswordEvent {}

class ResetPasswordInitEvent extends ResetPasswordEvent {}

class ResetPasswordValidateEvent extends ResetPasswordEvent {}

class ResetPasswordValidateEmailEvent extends ResetPasswordEvent {}

class ResetPasswordUpdateEvent extends ResetPasswordEvent {
  final ResetPasswordModel model;
  ResetPasswordUpdateEvent({required this.model});
}

class ResetPasswordSubmitEmailEvent extends ResetPasswordEvent {}

class ResetPasswordSubmitEvent extends ResetPasswordEvent {}
