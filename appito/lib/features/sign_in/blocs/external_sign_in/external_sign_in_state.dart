import 'package:appito/_all.dart';

enum ExternalSignInStateStatus {
  initializing,
  initialized,
  submitting,
  submittingSuccess,
  submittingError,
}

class ExternalSignInState {
  final ExternalSignInStateStatus status;
  final SignInProvider signInProvider;

  ExternalSignInState({
    required this.status,
    required this.signInProvider,
  });

  factory ExternalSignInState.initial() => ExternalSignInState(
        status: ExternalSignInStateStatus.initializing,
        signInProvider: SignInProvider.google,
      );

  ExternalSignInState copyWith({
    ExternalSignInStateStatus? status,
    SignInProvider? signInProvider,
  }) =>
      ExternalSignInState(
        status: status ?? this.status,
        signInProvider: signInProvider ?? this.signInProvider,
      );
}
