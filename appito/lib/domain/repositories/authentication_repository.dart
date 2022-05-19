import 'package:appito/_all.dart';

abstract class IAuthenticationRepository {
  /// Checks if there is a valid jwt and refresh token set in the API client
  Future<bool> isAuthenticated();

  /// Signs the user in and sets the token to API client headers and saves
  /// the user account data to storage
  Future<Result> signIn(SignInRequestModel model);

  /// Signs the user out, unauthorizes API client and deletes account data
  /// from storage
  Future<Result> signOut();
}

class MockAuthenticationRepository implements IAuthenticationRepository {
  final IRestApiClient restApiClient;
  final ICurrentUser currentUser;

  MockAuthenticationRepository({
    required this.restApiClient,
    required this.currentUser,
  });

  @override
  Future<bool> isAuthenticated() async => restApiClient.authHandler.isAuthorized();

  @override
  Future<Result> signIn(SignInRequestModel model) async {
    await Future.delayed(const Duration(seconds: 5));

    await restApiClient.authHandler.authorize(
      jwt: '<JWT_VALUE_HERE>',
      refreshToken: '<REFRESH_TOKEN_VALUE_HERE>',
    );

    await currentUser.refresh();

    return NetworkResult();
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

class AuthenticationRepository implements IAuthenticationRepository {
  final IRestApiClient restApiClient;
  final ICurrentUser currentUser;

  AuthenticationRepository({
    required this.restApiClient,
    required this.currentUser,
  });

  @override
  Future<bool> isAuthenticated() async => restApiClient.authHandler.isAuthorized();

  @override
  Future<Result> signIn(SignInRequestModel model) async {
    final result = await restApiClient.post(
      '/api/Authentication/sign-in',
      data: model.toJson(),
      parser: (data) => SignInResponseModel.fromJson(data),
    );

    if (result.hasData) {
      try {
        await restApiClient.authHandler.authorize(
          jwt: result.data?.token.value ?? '',
          refreshToken: result.data?.refreshToken.value ?? '',
        );

        await currentUser.refresh();
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return result;
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
