import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/interfaces/i_rest_api_client.dart';

abstract class IAuthenticationRepository {
  Future<bool> signIn(SignInModel model);
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IRestApiClient restApiClient;

  AuthenticationRepository({
    required this.restApiClient,
  });

  @override
  Future<bool> signIn(SignInModel model) async {
    return false;
  }
}
