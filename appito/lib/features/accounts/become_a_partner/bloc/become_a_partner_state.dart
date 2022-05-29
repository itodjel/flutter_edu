import 'package:appito/_all.dart';

class BecomeAPartnerState extends AbstractFormBasicState {
  BecomeAPartnerState({
    required super.formResultStatus,
  });

  factory BecomeAPartnerState.initial() => BecomeAPartnerState(formResultStatus: FormResultStatus.initializing);

  @override
  BecomeAPartnerState copyWith({
    FormResultStatus? formResultStatus,
  }) =>
      BecomeAPartnerState(
        formResultStatus: formResultStatus ?? this.formResultStatus,
      );
}
