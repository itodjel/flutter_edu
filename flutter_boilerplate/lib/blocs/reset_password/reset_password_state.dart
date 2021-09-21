import 'package:flutter_boilerplate/_all.dart';

enum ResetPasswordStateStatus {
  validating,
  validatingEmail,
  initial,
  submitting,
  emailSubmitting,
  emailSubmittingSuccess,
  emailSubmittingError,
  submittingSuccess,
  submittingError,
}

class ResetPasswordState {
  ResetPasswordStateStatus status;
  ResetPasswordModel model;
  bool submittedOnce;
  bool get showValidationErrors => status == ResetPasswordStateStatus.validating || submittedOnce;

  ResetPasswordState({
    required this.status,
    required this.model,
    this.submittedOnce = false,
  });

  ResetPasswordState copyWith({
    ResetPasswordStateStatus? status,
    ResetPasswordModel? model,
    bool? submittedOnce,
  }) =>
      ResetPasswordState(
        status: status ?? this.status,
        model: model ?? this.model,
        submittedOnce: submittedOnce ?? this.submittedOnce,
      );
}
