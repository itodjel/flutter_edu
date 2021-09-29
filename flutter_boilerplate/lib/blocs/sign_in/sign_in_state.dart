import 'package:flutter_boilerplate/_all.dart';

enum SignInStateStatus {
  initial,
  validating,
  submitting,
  submittingSuccess,
  submittingError,
}

class SignInState {
  SignInStateStatus status;
  SignInModel model;
  bool submittedOnce;

  SignInState({
    required this.status,
    required this.model,
    this.submittedOnce = false,
  });

  SignInState copyWith({
    SignInStateStatus? status,
    SignInModel? model,
    bool? submittedOnce,
  }) =>
      SignInState(
        status: status ?? this.status,
        model: model ?? this.model,
        submittedOnce: submittedOnce ?? this.submittedOnce,
      );
}
