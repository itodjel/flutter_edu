import 'package:appito/_all.dart';

class ExternalSignInState extends AbstractFormState<SignInWithExternalProviderRequestModel, SignInWithExternalProviderRequestModelValidator> {
  ExternalSignInState({
    required super.formResultStatus,
    super.model,
    super.modelValidator,
    super.autovalidate,
  });

  factory ExternalSignInState.initial() => ExternalSignInState(formResultStatus: FormResultStatus.initializing);

  @override
  ExternalSignInState copyWith({
    FormResultStatus? formResultStatus,
    SignInWithExternalProviderRequestModel? model,
    SignInWithExternalProviderRequestModelValidator? modelValidator,
    bool? autovalidate,
  }) =>
      ExternalSignInState(
        formResultStatus: formResultStatus ?? this.formResultStatus,
        model: model ?? this.model,
        modelValidator: modelValidator ?? this.modelValidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
