import 'package:flutter_boilerplate/_all.dart';

abstract class AuthenticationEvent {}

class AuthenticationCheckEvent extends AuthenticationEvent {}

class AuthenticationSignInUserFromApiEvent extends AuthenticationEvent {
  Account? account;
}

class AuthenticationSignOutUserEvent extends AuthenticationEvent {}
