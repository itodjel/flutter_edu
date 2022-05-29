import 'package:appito/_all.dart';

abstract class ICurrentUser {
  StreamController<AccountResponseModel?> data = StreamController<AccountResponseModel?>.broadcast();
  Future<String?> get id;
  Future<AccountResponseModel?> get instance;
  Future refresh();
}

class CurrentUser implements ICurrentUser {
  final IStorageRepository storage;
  final IRestApiClient restApiClient;
  @override
  StreamController<AccountResponseModel?> data = StreamController<AccountResponseModel?>.broadcast();

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

    data.add(result.data);

    await storage.set(AppKeys.current_user, result.data?.toJson());
  }
}
