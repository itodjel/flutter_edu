import 'package:appito/_all.dart';

abstract class IAuthenticationRepository {
  /// Checks if there is a valid jwt and refresh token set in the API client
  Future<bool> isAuthenticated();

  /// Signs the user in and sets the token to API client headers and saves
  /// the user account data to storage
  Future<Result> signIn(SignInRequestModel model);

  /// Signs the user in with external provider eg. Facebook, Google or Apple
  Future<Result> signInWithExternalProvider(SignInProvider signInProvider);

  /// Requests from the API to send SMS verification code
  Future<Result> sendSMSVerificationCode(SendSMSVerificationCodeRequestModel model);

  /// Sign the user in via phone number and verification code
  Future<Result> signInWithPhoneNumber(SignInWithPhoneNumberRequestModel model);

  /// Signs the user out, unauthorizes API client and deletes account data
  /// from storage
  Future<Result> signOut();

  /// Refreshes tokens for the user
  Future<Result> refreshSignIn();
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IRestApiClient restApiClient;
  final ICurrentUser currentUser;
  final AppSettings appSettings;

  AuthenticationRepository({
    required this.restApiClient,
    required this.currentUser,
    required this.appSettings,
  });

  @override
  Future<bool> isAuthenticated() async => restApiClient.authHandler.isAuthorized();

  @override
  Future<Result> signIn(SignInRequestModel model) async {
    return await restApiClient.post(
      '/api/Authentication/sign-in',
      data: model.toJson(),
      parser: (data) async => await _authorize(SignInResponseModel.fromJson(data)),
    );
  }

  @override
  Future<Result> signInWithExternalProvider(SignInProvider signInProvider) async {
    switch (signInProvider) {
      case SignInProvider.google:
        return _signInWithGoogle();
      case SignInProvider.facebook:
        return _signInWithFacebook();
      case SignInProvider.apple:
        return _signInWithApple();
      default:
        return NetworkResult(exception: Exception('No implemented'));
    }
  }

  Future<Result> _signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        scopes: [
          'profile',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );

      final googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final googleSignInAuthentication = await googleSignInAccount.authentication;

        return await _externalLogin(
          SignInWithExternalProviderRequestModel(
            signInProvider: SignInProvider.google,
            accessToken: googleSignInAuthentication.accessToken,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return NetworkResult(exception: Exception());
  }

  Future<Result> _signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);

      if (result.status == LoginStatus.success) {
        return await _externalLogin(
          SignInWithExternalProviderRequestModel(
            signInProvider: SignInProvider.facebook,
            accessToken: result.accessToken!.token,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return NetworkResult(exception: Exception());
  }

  Future<Result> _signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: appSettings.authSettings.appleServiceId,
          redirectUri: Uri.parse(appSettings.authSettings.appleRedirectUrl),
        ),
      );

      return await _externalLogin(
        SignInWithExternalProviderRequestModel(
          signInProvider: SignInProvider.apple,
          accessToken: credential.identityToken,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return NetworkResult(exception: Exception());
  }

  Future<Result> _externalLogin(SignInWithExternalProviderRequestModel model) async {
    return await restApiClient.post(
      '/api/Authentication/sign-in-with-external-provider',
      data: model.toJson(),
      parser: (data) async => await _authorize(SignInResponseModel.fromJson(data)),
    );
  }

  Future _authorize(SignInResponseModel model) async {
    try {
      await restApiClient.authHandler.authorize(
        jwt: model.token.value,
        refreshToken: model.refreshToken.value,
      );

      await currentUser.refresh();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Result> sendSMSVerificationCode(SendSMSVerificationCodeRequestModel model) async {
    return await restApiClient.post(
      '/api/Authentication/send-sms-verification-code',
      data: model.toJson(),
    );
  }

  @override
  Future<Result> signInWithPhoneNumber(SignInWithPhoneNumberRequestModel model) async {
    return await restApiClient.post(
      '/api/Authentication/sign-in-with-phone-number',
      data: model.toJson(),
      parser: (data) async => await _authorize(SignInResponseModel.fromJson(data)),
    );
  }

  @override
  Future<Result> refreshSignIn() async {
    return await restApiClient.post(
      '/api/Authentication/refresh-sign-in',
      parser: (data) async => await _authorize(SignInResponseModel.fromJson(data)),
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
