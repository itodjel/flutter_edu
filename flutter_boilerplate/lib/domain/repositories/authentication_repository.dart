import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';

abstract class IAuthenticationRepository {
  //For now it checks of there is jwt in Authorization header
  Future<bool> isAuthenticated();
  Future<bool> signIn(SignInModel model);
  Future<bool> signOut();
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IRestApiClient restApiClient;
  final IStorageRepository storageRepository;

  AuthenticationRepository({
    required this.restApiClient,
    required this.storageRepository,
  });

  @override
  Future<bool> isAuthenticated() async => await restApiClient.isAuthorized();

  @override
  Future<bool> signIn(SignInModel model) async {
    try {
      final response = await restApiClient.post(
        '/authentication/signIn',
        data: model.toMap(),
      );

      //Save jwt and refresh token from response to restApiClient
      //instance to be used in every subsequent request in
      //Authorization header and to refresh token when jwt expires
      final jwt = response.result['jwt'];
      final refreshToken = response.result['refreshToken'];
      if (jwt != null && refreshToken != null) {
        await restApiClient.addAuthorization(jwt: jwt, refreshToken: refreshToken);
      }

      //After successfull sign in save the users account to storage
      //on this device, usefull when there is no connection to show
      //some initial profile data to the user
      final accountResponse = await restApiClient.get('/customer');
      if (accountResponse.result != null) {
        final account = Account.fromMap(accountResponse.result);

        await storageRepository.set(AppKeys.account, account.toMap());
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      //Removes Authorization header and deletes refresh token from storage
      await restApiClient.removeAuthorization();
      //Removes locally saved account data
      await storageRepository.delete(AppKeys.account);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
