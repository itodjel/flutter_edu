import 'package:appito/_all.dart';

class StorageConfiguration {
  static Future configure() async {
    final storageRepository = StorageRepository();
    await storageRepository.init();

    services.registerSingleton<IStorageRepository>(storageRepository);
  }
}
