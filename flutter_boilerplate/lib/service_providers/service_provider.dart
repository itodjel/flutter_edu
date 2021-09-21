import 'package:catcher/catcher.dart';
import 'package:intl/intl.dart';
import 'package:tailgreeter/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:tailgreeter/common/error_handling/extended_slack_handler.dart';
import 'package:tailgreeter/domain/repositories/categories_repository.dart';

class DevelopmentServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = developmentAppSettings;
}

class StagingServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = stagingAppSettings;
}

class EvaluationServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = evaluationAppSettings;
}

class ProductionServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = productionAppSettings;
}

abstract class ServiceProvider {
  late AppSettings appSettings;
  late CatcherOptions catcherOptions;
  late IRestApiClient restApiClient;
  late IStorageRepository storageRepository;
  late IStorageRepository cacheStorageRepository;
  late IStorageRepository secureStorageRepository;
  late IAccountRepository accountRepository;
  late IAuthenticationRepository authenticationRepository;
  // late IChatRepository chatRepository;
  late IEventsRepository eventsRepository;
  late IGalleryRepository galleryRepository;
  late ILocationRepository locationRepository;
  late IPermissionsRepository permissionsRepository;
  late IHostRepository hostRepository;
  late IOrdersRepository ordersRepository;
  late IShoppingCartRepository shoppingCartRepository;
  late ITicketsRepository ticketsRepository;
  late ICategoriesRepository categoriesRepository;
  late IDonationsRepository donationsRepository;
  //Add new repositories and services here
  //...

  Future<void> init() async {
    await initAppSettings();
    await initStorage();
    await initRestApiClient();
    await initRespositories();
    //TODO: Uncomment once the chat feature needs to be implemented
    //await initChat();
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

  Future<void> initChat() async {
    // await chatRepository.init();
  }

  Future<void> initRespositories() async {
    //Those without dependencies(restApiClient dependency excluded)
    eventsRepository = EventsRepository(restApiClient: restApiClient, storageRepository: cacheStorageRepository);
    galleryRepository = GalleryRepository();
    permissionsRepository = PermissionsRepository();
    ordersRepository = OrdersRepository(restApiClient: restApiClient);
    shoppingCartRepository = ShoppingCartRepository(restApiClient: restApiClient, storageRepository: cacheStorageRepository);
    ticketsRepository = TicketsRepository(restApiClient: restApiClient);
    categoriesRepository = CategoriesRepository(restApiClient: restApiClient, storageRepository: cacheStorageRepository);
    locationRepository = LocationRepository(appSettings: appSettings);

    //Those with dependencies
    authenticationRepository = AuthenticationRepository(restApiClient: restApiClient, storageRepository: secureStorageRepository);
    // chatRepository = ChatRepository(appSettings: appSettings, storageRepository: secureStorageRepository);
    accountRepository = AccountRepository(restApiClient: restApiClient, storageRepository: secureStorageRepository, locationRepository: locationRepository);
    hostRepository = HostRepository(restApiClient: restApiClient);
    donationsRepository = DonationsRepository(restApiClient: restApiClient);
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
    case EnvironmentType.staging:
      serviceProvider = StagingServiceProvider();
      break;
    case EnvironmentType.evaluation:
      serviceProvider = EvaluationServiceProvider();
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
