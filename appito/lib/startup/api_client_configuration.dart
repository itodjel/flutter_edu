import 'package:appito/_all.dart';

class ApiClientConfiguration {
  static Future configure() async {
    final IRestApiClient restApiClient = RestApiClient(
      options: RestApiClientOptions(
        baseUrl: services.get<AppSettings>().baseApiUrl,
        cacheEnabled: true,
      ),
      authOptions: AuthOptions(
        refreshTokenEndpoint: '/api/Authentication/refresh-token',
        refreshTokenParameterName: 'refreshToken',
        resolveJwt: (response) => SignInResponseModel.fromJson(response.data).token.value,
        resolveRefreshToken: (response) => SignInResponseModel.fromJson(response.data).refreshToken.value,
      ),
      loggingOptions: services.get<AppSettings>().loggingOptions,
    );

    await restApiClient.init();

    if (services.get<AppSettings>().resetStorageOnRestart) {
      await restApiClient.clearStorage();
    }

    services.registerSingleton<IRestApiClient>(restApiClient);
  }
}
