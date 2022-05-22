import 'package:appito/domain/enumerations/_all.dart';

abstract class ExternalSignInEvent {}

class ExternalSignInInitEvent extends ExternalSignInEvent {
  final SignInProvider signInProvider;

  ExternalSignInInitEvent({required this.signInProvider});
}

class ExternalSignInSubmitEvent extends ExternalSignInEvent {}
