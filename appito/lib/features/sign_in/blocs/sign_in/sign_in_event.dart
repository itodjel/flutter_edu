import 'package:appito/domain/models/authentication/requests/_all.dart';

abstract class SignInEvent {}

class SignInInitEvent extends SignInEvent {}

class SignInUpdateEvent extends SignInEvent {
  final SignInRequestModel model;

  SignInUpdateEvent({required this.model});
}

class SignInSubmitEvent extends SignInEvent {}
