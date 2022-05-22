import 'package:appito/_all.dart';

enum SignInStateStatus {
  initializing,
  initialized,
  submitting,
  submittingSuccess,
  submittingError,
  validationError,
}

class SignInState {
  final SignInStateStatus status;
  final SignInRequestModel model;
  bool autovalidate;

  SignInState({
    required this.status,
    required this.model,
    this.autovalidate = false,
  });

  factory SignInState.initial() => SignInState(
        status: SignInStateStatus.initializing,
        model: SignInRequestModel(),
      );

  SignInState copyWith({
    SignInStateStatus? status,
    SignInRequestModel? model,
    bool? autovalidate,
  }) =>
      SignInState(
        status: status ?? this.status,
        model: model ?? this.model,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
