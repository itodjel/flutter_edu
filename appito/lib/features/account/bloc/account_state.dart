import 'package:appito/_all.dart';

class AccountState extends AbstractItemState<AccountResponseModel> {
  AccountState({
    required ResultStatus resultStatus,
    AccountResponseModel? item,
  }) : super(
          resultStatus: resultStatus,
          item: item,
        );

  factory AccountState.initial() => AccountState(resultStatus: ResultStatus.loading);

  @override
  AccountState copyWith({
    ResultStatus? resultStatus,
    AccountResponseModel? item,
  }) =>
      AccountState(
        resultStatus: resultStatus ?? this.resultStatus,
        item: item ?? this.item,
      );
}
