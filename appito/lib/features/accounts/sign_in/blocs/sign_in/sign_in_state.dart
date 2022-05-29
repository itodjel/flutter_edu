import 'package:appito/_all.dart';

class SignInState extends AbstractFormState<SignInRequestModel, SignInRequestModelValidator> {
  SignInState({
    required super.formResultStatus,
    super.model,
    super.modelValidator,
    super.autovalidate,
  });

  factory SignInState.initial() => SignInState(
        formResultStatus: FormResultStatus.initializing,
        model: SignInRequestModel(),
      );

  @override
  SignInState copyWith({
    FormResultStatus? formResultStatus,
    SignInRequestModel? model,
    SignInRequestModelValidator? modelValidator,
    bool? autovalidate,
  }) =>
      SignInState(
        formResultStatus: formResultStatus ?? this.formResultStatus,
        model: model ?? this.model,
        modelValidator: modelValidator ?? this.modelValidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
