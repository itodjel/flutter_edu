import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';

abstract class IAccountRepository {
  Future<bool> register(RegisterModel model);
}

class AccountRepository extends IAccountRepository {
  final IRestApiClient restApiClient;

  AccountRepository({
    required this.restApiClient,
  });

  @override
  Future<bool> register(RegisterModel model) async {
    try {
      restApiClient.options.contentType = RestApiClientKeys.multipartFormData;

      await restApiClient.post(
        '/account/Register',
        data: model.toMap(),
      );

      restApiClient.options.contentType = Headers.jsonContentType;

      return true;
    } catch (e) {
      restApiClient.options.contentType = Headers.jsonContentType;
      print(e);
      return false;
    }
  }
}
