import 'package:flutter_boilerplate/all.dart';

late EnvironmentType ENVIRONMENT;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceProvider = ServiceProvider();
  await serviceProvider.init();

  // setSystemUIOverlayStyle();

  // Intl.defaultLocale = Localizer.defaultLanguage.locale.languageCode;

  // await _configureFirebase();

  // runZoned(
  //   () {
  //     runApp(
  //       RepositoryProvider<ServiceProvider>(
  //         create: (context) => serviceProvider,
  //         child: GeneralContextServiceProvider(
  //           child: BlocContextServiceProvider(
  //             child: Application(),
  //           ),
  //         ),
  //       ),
  //     );
  //   },
  // );
}
