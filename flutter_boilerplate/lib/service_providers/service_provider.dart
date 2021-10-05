import 'package:catcher/catcher.dart';
import 'package:intl/intl.dart';
import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:flutter_boilerplate/common/error_handling/extended_slack_handler.dart';

class DevelopmentServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = developmentAppSettings;
}

class EvaluationServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = evaluationAppSettings;
}

class StagingServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = stagingAppSettings;
}

class ProductionServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = productionAppSettings;
}

abstract class ServiceProvider {
  late AppSettings appSettings;
  late CatcherOptions catcherOptions;
  late IRestApiClient restApiClient;
  late IAccountRepository accountRepository;
  late IStorageRepository storageRepository;
  late IStorageRepository cacheStorageRepository;
  late IStorageRepository secureStorageRepository;
  late IGalleryRepository galleryRepository;
  late ILocationRepository locationRepository;
  late IAuthenticationRepository authenticationRepository;
  //Add new repositories and services here
  //...

  Future<void> init() async {
    await initAppSettings();
    await initStorage();
    await initRestApiClient();
    await initRespositories();
    await initExceptionHandling();
    await initDateTimeDefaults();
  }

  Future<void> initAppSettings();

  Future<void> initStorage() async {
    storageRepository = StorageRepository();
    await storageRepository.init();
    cacheStorageRepository = StorageRepository(key: 'CACHE_BOX');
    await cacheStorageRepository.init();
    secureStorageRepository = SecureStorageRepository();
    await secureStorageRepository.init();

    if (appSettings.resetStorageOnRestart) {
      await storageRepository.clear();
      await secureStorageRepository.clear();
    }
  }

  Future<void> initRestApiClient() async {
    restApiClient = RestApiClient(
      restApiClientOptions: RestApiClientOptions(
        baseUrl: appSettings.baseApiUrl,
        logNetworkTraffic: appSettings.logNetworkTraffic,
        keepRetryingOnNetworkError: appSettings.keepRetryingOnNetworkError,
        refreshTokenEndpoint: '/auth/token-refresh',
        refreshTokenParameterName: 'token',
        resolveJwt: (response) => response.data['result']['accessToken']['token'],
        resolveRefreshToken: (response) => response.data['result']['refreshToken']['token'],
      ),
    );
    await restApiClient.init();
    restApiClient.options.contentType = Headers.jsonContentType;
  }

  Future<void> initRespositories() async {
    accountRepository = AccountRepository(restApiClient: restApiClient);
    galleryRepository = GalleryRepository();
    locationRepository = LocationRepository(appSettings: appSettings);
    authenticationRepository = AuthenticationRepository(restApiClient: restApiClient, storageRepository: secureStorageRepository);
  }

  Future<void> initExceptionHandling() async {
    if (appSettings.usingExceptionReporting) {
      catcherOptions = CatcherOptions(
        SilentReportMode(),
        [
          ExtendedSlackHandler(
            appSettings.exceptionReportingSettings.slackWebHookUrl,
            appSettings.exceptionReportingSettings.slackChannel,
            iconEmoji: ':thinking_face:',
            enableDeviceParameters: appSettings.exceptionReportingSettings.enableDeviceParameters,
            enableApplicationParameters: appSettings.exceptionReportingSettings.enableApplicationParameters,
            enableCustomParameters: appSettings.exceptionReportingSettings.enableCustomParameters,
            enableStackTrace: appSettings.exceptionReportingSettings.enableStackTrace,
            printLogs: appSettings.exceptionReportingSettings.printLogs,
            extendMessage: (String message) async {
              final StringBuffer stringBuffer = StringBuffer();
              await storageRepository.log();
              stringBuffer.write(message);
              stringBuffer.write('*Storage:* ```${await storageRepository.asString()}```\n');

              if (!environment.isProduction) {
                stringBuffer.write('*Secure storage:* ```${await secureStorageRepository.asString()}```\n');
              }

              return stringBuffer.toString();
            },
          ),
        ],
      );
    }
  }

  Future<void> initDateTimeDefaults() async {
    Intl.defaultLocale = Localizer.defaultLanguage.locale.languageCode;
  }
}

Future<ServiceProvider> resolveServiceProviderFromEnvironment() async {
  ServiceProvider serviceProvider;

  switch (environment) {
    case EnvironmentType.development:
      serviceProvider = DevelopmentServiceProvider();
      break;
    case EnvironmentType.evaluation:
      serviceProvider = EvaluationServiceProvider();
      break;
    case EnvironmentType.staging:
      serviceProvider = StagingServiceProvider();
      break;
    case EnvironmentType.production:
      serviceProvider = ProductionServiceProvider();
      break;
    default:
      serviceProvider = ProductionServiceProvider();
  }

  await serviceProvider.init();

  return serviceProvider;
}
