import 'package:appito/_all.dart';

enum AccountStateStatus {
  initial,
  toggling,
  togglingSuccess,
  togglingError,
}

class AccountState extends AbstractItemState<AccountResponseModel> {
  final AccountStateStatus status;

  bool get showCompaniesToggle => (item?.employees?.length ?? 0) >= 2;
  bool get showProfilePhoto => item?.photoUrl != null;
  bool isCompanySelected(int? companyId) => item?.currentCompany?.id == companyId;
  bool isThirdPartySignInProviderConnected(SignInProvider signInProvider) => item?.externalUsers?.any((x) => x.signInProvider == signInProvider) ?? false;

  AccountState({
    required this.status,
    required ResultStatus resultStatus,
    AccountResponseModel? item,
  }) : super(
          resultStatus: resultStatus,
          item: item,
        );

  factory AccountState.initial() => AccountState(
        status: AccountStateStatus.initial,
        resultStatus: ResultStatus.loading,
      );

  @override
  AccountState copyWith({
    AccountStateStatus? status,
    ResultStatus? resultStatus,
    AccountResponseModel? item,
  }) =>
      AccountState(
        status: status ?? this.status,
        resultStatus: resultStatus ?? this.resultStatus,
        item: item ?? this.item,
      );
}
