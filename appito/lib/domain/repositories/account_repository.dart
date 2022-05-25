import 'package:appito/_all.dart';

abstract class IAccountRepository {
  /// Loads user account data from network
  Future<Result<AccountResponseModel>> getCurrentUserAccountData();

  /// Loads user account data from cache + from network
  Stream<Result<AccountResponseModel>> getCurrentUserAccountDataStreamed();
}

class AccountRepository implements IAccountRepository {
  final IRestApiClient restApiClient;

  AccountRepository({required this.restApiClient});

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
}
