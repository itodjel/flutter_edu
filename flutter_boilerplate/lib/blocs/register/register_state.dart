import 'package:flutter_boilerplate/_all.dart';

enum RegisterStateStatus {
  initial,
  validating,
  submitting,
  submittingSuccess,
  submittingError,
}

class RegisterState {
  RegisterStateStatus status;
  RegisterModel model;
  bool submittedOnce;
  bool get showValidationErrors => status == RegisterStateStatus.validating || submittedOnce;

  RegisterState({
    required this.status,
    required this.model,
    required this.submittedOnce,
  });

  RegisterState copyWith({
    RegisterStateStatus? status,
    RegisterModel? model,
    bool? submittedOnce,
  }) =>
      RegisterState(
        status: status ?? this.status,
        model: model ?? this.model,
        submittedOnce: submittedOnce ?? this.submittedOnce,
      );
}
