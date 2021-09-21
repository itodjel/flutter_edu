import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_boilerplate/_all.dart';
import 'package:flutter_boilerplate/flavors.dart';
import 'package:flutter_boilerplate/main.dart' as app;

Future main() async {
  F.appFlavor = Flavor.evaluation;

  enableFlutterDriverExtension();
  environment = EnvironmentType.evaluation;

  await app.main();
}
