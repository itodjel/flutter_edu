import 'package:flutter_boilerplate/_all.dart';
import 'package:flutter_boilerplate/main.dart' as app;
import 'package:flutter_boilerplate/flavors.dart';

Future main() async {
  F.appFlavor = Flavor.production;
  environment = EnvironmentType.production;
  await app.main();
}
