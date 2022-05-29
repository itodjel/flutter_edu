import 'package:appito/_all.dart';

class SignUpState extends AbstractFormState<SignUpRequestModel, SignUpRequestModelValidator> {
  SignUpState({
    required super.formResultStatus,
    super.model,
    super.modelValidator,
    super.autovalidate,
  });

  factory SignUpState.initial() => SignUpState(
        formResultStatus: FormResultStatus.initializing,
        model: SignUpRequestModel(),
      );

  @override
  SignUpState copyWith({
    FormResultStatus? formResultStatus,
    SignUpRequestModel? model,
    SignUpRequestModelValidator? modelValidator,
    bool? autovalidate,
  }) =>
      SignUpState(
        formResultStatus: formResultStatus ?? this.formResultStatus,
        model: model ?? this.model,
        modelValidator: modelValidator ?? this.modelValidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
