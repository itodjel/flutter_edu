import 'package:appito/_all.dart';

class AccountUpdateState extends AbstractFormState<AccountUpdateRequestModel, AccountUpdateRequestModelValidator> {
  AccountUpdateState({
    required super.formResultStatus,
    super.model,
    super.modelValidator,
    super.autovalidate,
  });

  factory AccountUpdateState.initial() => AccountUpdateState(formResultStatus: FormResultStatus.initializing);

  @override
  AccountUpdateState copyWith({
    FormResultStatus? formResultStatus,
    AccountUpdateRequestModel? model,
    AccountUpdateRequestModelValidator? modelValidator,
    bool? autovalidate,
  }) =>
      AccountUpdateState(
        formResultStatus: formResultStatus ?? this.formResultStatus,
        model: model ?? this.model,
        modelValidator: modelValidator ?? this.modelValidator,
        autovalidate: autovalidate ?? this.autovalidate,
      );
}
