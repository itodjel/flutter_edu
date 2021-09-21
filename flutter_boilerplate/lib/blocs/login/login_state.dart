import 'package:flutter_boilerplate/_all.dart';

enum LoginStateStatus {
  initial,
  validating,
  submitting,
  submittingSuccess,
  submittingError,
}

class LoginState {
  LoginStateStatus status;
  LoginModel model;
  bool submittedOnce;
  bool get showValidationErrors => status == LoginStateStatus.validating || submittedOnce;

  LoginState({
    required this.status,
    required this.model,
    this.submittedOnce = false,
  });

  LoginState copyWith({
    LoginStateStatus? status,
    LoginModel? model,
    bool? submittedOnce,
  }) =>
      LoginState(
        status: status ?? this.status,
        model: model ?? this.model,
        submittedOnce: submittedOnce ?? this.submittedOnce,
      );
}
