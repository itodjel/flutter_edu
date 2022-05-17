import 'package:appito/_all.dart';

abstract class IAuthenticationRepository {
  Future<bool> isAuthenticated();
  Future<Result> signIn(SignInRequestModel model);
  Future<Result> signOut();
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IRestApiClient restApiClient;

  AuthenticationRepository({required this.restApiClient});

  @override
  Future<bool> isAuthenticated() async => restApiClient.authHandler.isAuthorized();

  @override
  Future<Result> signIn(SignInRequestModel model) async {
    return await restApiClient.post(
      '/api/Authentication/sign-in',
      data: model.toJson(),
      parser: (data) async {
        final signInResponseModel = SignInResponseModel.fromJson(data);

        await restApiClient.authHandler.authorize(
          jwt: signInResponseModel.token.value,
          refreshToken: signInResponseModel.refreshToken.value,
        );

        return signInResponseModel;
      },
    );
  }

  @override
  Future<Result> signOut() async {
    try {
      await restApiClient.authHandler.unAuthorize();

      return NetworkResult();
    } catch (e) {
      return NetworkResult(exception: Exception(e));
    }
  }
}
