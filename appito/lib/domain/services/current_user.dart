import 'package:appito/_all.dart';

abstract class ICurrentUser {
  Future<String?> get id;
  Future<AccountResponseModel?> get instance;
  Future refresh();
}

class CurrentUser implements ICurrentUser {
  final IStorageRepository storage;
  final IRestApiClient restApiClient;

  CurrentUser({
    required this.storage,
    required this.restApiClient,
  });

  @override
  Future<String?> get id async => (await instance)?.id;

  @override
  Future<AccountResponseModel?> get instance async {
    try {
      final currentUser = await storage.get(AppKeys.current_user);

      return AccountResponseModel.fromJson(currentUser);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future refresh() async {
    restApiClient.exceptionHandler.exceptionOptions.disable();

    final result = await restApiClient.get(
      '/api/Account/current-user-account-data',
      parser: (data) => AccountResponseModel.fromJson(data),
    );

    await storage.set(AppKeys.current_user, result.data?.toJson());
  }
}
