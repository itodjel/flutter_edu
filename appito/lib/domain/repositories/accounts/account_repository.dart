import 'package:appito/_all.dart';

abstract class IAccountRepository {
  /// Loads user account data from network
  Future<Result<AccountResponseModel>> getCurrentUserAccountData();

  /// Loads user account data from cache + from network
  Stream<Result<AccountResponseModel>> getCurrentUserAccountDataStreamed();

  /// Toggle current company for the user, or changes the perspective to
  /// client's view of the system if the company is null
  Future<Result> toggleCurrentCompany(ToggleCurrentCompanyRequestModel model);

  /// Changes password for the currently logged in user
  Future<Result> changePassword(ChangePasswordRequestModel model);

  /// Prepares account update model
  Future<Result<AccountUpdateRequestModel>> prepareForUpdate();

  /// Updates current user's account info
  Future<Result> update(AccountUpdateRequestModel model);

  /// Updates current user's account type to AccountType.partner
  Future<Result> becomeAPartner();
}

class AccountRepository implements IAccountRepository {
  final IRestApiClient restApiClient;
  final ICurrentUser currentUser;

  AccountRepository({
    required this.restApiClient,
    required this.currentUser,
  });

  @override
  Future<Result<AccountResponseModel>> getCurrentUserAccountData() async {
    return await restApiClient.get(
      '/api/Account/current-user-account-data',
      parser: (data) => AccountResponseModel.fromJson(data),
    );
  }

  @override
  Stream<Result<AccountResponseModel>> getCurrentUserAccountDataStreamed() {
    return restApiClient.getStreamed(
      '/api/Account/current-user-account-data',
      parser: (data) => AccountResponseModel.fromJson(data),
    );
  }

  @override
  Future<Result> toggleCurrentCompany(ToggleCurrentCompanyRequestModel model) async {
    return await restApiClient.put(
      '/api/Account/toggle-current-company',
      data: model.toJson(),
    );
  }

  @override
  Future<Result> changePassword(ChangePasswordRequestModel model) async {
    return await restApiClient.put(
      '/api/Account/change-password',
      data: model.toJson(),
    );
  }

  @override
  Future<Result<AccountUpdateRequestModel>> prepareForUpdate() async {
    return await restApiClient.get(
      '/api/Account/prepare-for-update',
      parser: (data) => AccountUpdateRequestModel.fromJson(data),
    );
  }

  @override
  Future<Result> update(AccountUpdateRequestModel model) async {
    return await restApiClient.put(
      '/api/Account/update',
      data: model.toJson(),
    );
  }

  @override
  Future<Result> becomeAPartner() async {
    final result = await restApiClient.put('/api/Account/become-a-partner');

    if (result.isSuccess) {
      await currentUser.refresh();
    }

    return result;
  }
}
