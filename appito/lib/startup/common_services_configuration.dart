import 'package:appito/_all.dart';

class CommonServicesConfiguration {
  static void configure() {
    services.registerSingleton<IToast>(Toast());
    services.registerSingleton<IPlatformService>(PlatformService());
  }
}
