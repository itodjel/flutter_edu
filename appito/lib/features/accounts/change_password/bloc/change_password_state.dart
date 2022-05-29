import 'package:appito/_all.dart';

class ChangePasswordState extends AbstractFormState<ChangePasswordRequestModel, ChangePasswordRequestModelValidator> {
  ChangePasswordState({
    required super.formResultStatus,
    super.model,
    super.modelValidator,
    super.autovalidate,
  });

  factory ChangePasswordState.initial() => ChangePasswordState(
        formResultStatus: FormResultStatus.initializing,
        model: ChangePasswordRequestModel(),
      );

  @override
  ChangePasswordState copyWith({
    FormResultStatus? formResultStatus,
    ChangePasswordRequestModel? model,
    ChangePasswordRequestModelValidator? modelValidator,
    bool? autovalidate,
  }) =>
      ChangePasswordState(
        formResultStatus: formResultStatus ?? this.formResultStatus,
        model: model ?? this.model,
        modelValidator: modelValidator ?? this.modelValidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
