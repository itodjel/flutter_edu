abstract class AuthEvent {}

class AuthCheckEvent extends AuthEvent {}

class AuthRefreshEvent extends AuthEvent {}

class AuthSignOutEvent extends AuthEvent {}
