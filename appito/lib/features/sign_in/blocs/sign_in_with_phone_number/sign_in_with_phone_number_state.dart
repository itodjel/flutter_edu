import 'package:appito/_all.dart';

enum SignInWithPhoneNumberStateStatus {
  initializing,
  initialized,
  submitting,
  submittingSuccess,
  submittingError,
  validationError,
}

class SignInWithPhoneNumberState {
  final SignInWithPhoneNumberStateStatus status;
  final SignInWithPhoneNumberRequestModel model;
  SignInWithPhoneNumberRequestModelValidator? modelvalidator;
  bool autovalidate;

  SignInWithPhoneNumberState({
    required this.status,
    required this.model,
    this.modelvalidator,
    this.autovalidate = false,
  });

  factory SignInWithPhoneNumberState.initial() => SignInWithPhoneNumberState(
        status: SignInWithPhoneNumberStateStatus.initializing,
        model: SignInWithPhoneNumberRequestModel(),
      );

  SignInWithPhoneNumberState copyWith({
    SignInWithPhoneNumberStateStatus? status,
    SignInWithPhoneNumberRequestModel? model,
    SignInWithPhoneNumberRequestModelValidator? modelvalidator,
    bool? autovalidate,
  }) =>
      SignInWithPhoneNumberState(
        status: status ?? this.status,
        model: model ?? this.model,
        modelvalidator: modelvalidator ?? this.modelvalidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
