import 'package:appito/_all.dart';

class CommonServicesConfiguration {
  static Future configure() async {
    services.registerSingleton<IToast>(Toast());
  }
}
