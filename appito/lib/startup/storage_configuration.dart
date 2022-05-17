import 'package:appito/_all.dart';

class StorageConfiguration {
  static Future configure() async {
    final storageRepository = StorageRepository();
    await storageRepository.init();

    if (services.get<AppSettings>().resetStorageOnRestart) {
      await storageRepository.clear();
    }
    if (services.get<AppSettings>().loggingOptions.logStorage) {
      await storageRepository.log();
    }

    services.registerSingleton<IStorageRepository>(storageRepository);
  }
}
