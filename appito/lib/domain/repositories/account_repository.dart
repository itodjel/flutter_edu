import 'package:appito/_all.dart';

abstract class IAccountRepository {
  /// Loads user account data from network
  Future<Result<AccountResponseModel>> getCurrentUserAccountData();

  /// Loads user account data from cache + from network
  Stream<Result<AccountResponseModel>> getCurrentUserAccountDataStreamed();

  /// Toggle current company for the user, or changes the perspective to
  /// client's view of the system if the company is null
  Future<Result> toggleCurrentCompany(ToggleCurrentCompanyRequestModel model);
}

class MockAccountRepository implements IAccountRepository {
  @override
  Future<Result<AccountResponseModel>> getCurrentUserAccountData() async {
    return NetworkResult(data: AccountResponseModel(id: '<USER_ID_STRING_VALUE>'));
  }

  @override
  Stream<Result<AccountResponseModel>> getCurrentUserAccountDataStreamed() async* {
    yield NetworkResult(data: AccountResponseModel(id: '<USER_ID_STRING_VALUE>'));
  }

  @override
  Future<Result> toggleCurrentCompany(ToggleCurrentCompanyRequestModel model) async => NetworkResult();
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

  @override
  Future<Result> toggleCurrentCompany(ToggleCurrentCompanyRequestModel model) async {
    return await restApiClient.put(
      '/api/Account/toggle-current-company',
      data: model.toJson(),
    );
  }
}
