import 'package:appito/_all.dart';

abstract class ExternalSignInEvent {}

class ExternalSignInInitEvent extends AbstractFormEvent {
  final SignInWithExternalProviderRequestModel model;

  ExternalSignInInitEvent({required this.model});
}
