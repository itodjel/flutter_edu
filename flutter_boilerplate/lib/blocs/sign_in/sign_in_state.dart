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
  SignInModelValidator modelValidator;
  bool submittedOnce;

  SignInState({
    required this.status,
    required this.model,
    required this.modelValidator,
    this.submittedOnce = false,
  });

  SignInState copyWith({
    SignInStateStatus? status,
    SignInModel? model,
    SignInModelValidator? modelValidator,
    bool? submittedOnce,
  }) =>
      SignInState(
        status: status ?? this.status,
        model: model ?? this.model,
        modelValidator: modelValidator ?? this.modelValidator,
        submittedOnce: submittedOnce ?? this.submittedOnce,
      );
}
