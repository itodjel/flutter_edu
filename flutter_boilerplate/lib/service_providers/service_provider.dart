import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:storage_repository/storage_repository.dart';

class ServiceProvider {
  late IRestApiClient restApiClient;
  late AppSettings appSettings;
  late IStorageRepository storageRepository;
  late IStorageRepository secureStorageRepository;
  //Add new repositories and services here
  //...

  Future _initForDevelopment() async {
    //Storage repositories configuration - START
    storageRepository = StorageRepository();
    await storageRepository.init();
    secureStorageRepository = SecureStorageRepository();
    await secureStorageRepository.init();

    if (appSettings.resetStorageOnRestart) {
      await storageRepository.clear();
      await secureStorageRepository.clear();
    }
    //Storage repositories configuration - END

    //Rest api client configuration - START
    restApiClient = RestApiClient(
      restApiClientOptions: RestApiClientOptions(
        baseUrl: appSettings.baseApiUrl,
        logNetworkTraffic: appSettings.logNetworkTraffic,
        refreshTokenEndpoint: '/Authentication/RefreshToken',
        refreshTokenParameterName: 'value',
        resolveJwt: (response) => response.data['result']['jwt'],
        resolveRefreshToken: (response) => response.data['result']['refreshToken'],
      ),
    );
    await restApiClient.init();
    restApiClient.options.contentType = Headers.jsonContentType;
    //Rest api client configuration - END

    //Add new repositories and services here
    //...
  }

  Future _initForEvaluation() async {
    //Here you would register MockRepositories
    //...
  }
  Future _initForStaging() async {
    await _initForDevelopment();
    //Here you would re-register some of the services if there is a specific implementation that differs from development
    //...
  }

  Future _initForProduction() async {
    await _initForDevelopment();
    //Here you would re-register some of the services if there is a specific implementation that differs from development
    //...
  }

  ServiceProvider() {
    switch (environment) {
      case EnvironmentType.development:
        appSettings = DevelopmentAppSettings();
        break;
      case EnvironmentType.evaluation:
        appSettings = TestAppSettings();
        break;
      case EnvironmentType.staging:
        appSettings = StagingAppSettings();
        break;
      case EnvironmentType.production:
        appSettings = ProductionAppSettings();
        break;
    }
  }

  Future init() async {
    switch (environment) {
      case EnvironmentType.development:
        await _initForDevelopment();
        break;
      case EnvironmentType.evaluation:
        await _initForEvaluation();
        break;
      case EnvironmentType.staging:
        await _initForStaging();
        break;
      case EnvironmentType.production:
        await _initForProduction();
        break;
    }
  }
}
