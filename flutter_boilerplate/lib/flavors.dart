enum Flavor {
  PRODUCTION,
  STAGING,
  DEVELOPMENT,
}

class F {
  static late Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'Flutter Boilerplate';
      case Flavor.STAGING:
        return 'Flutter Boilerplate Staging';
      case Flavor.DEVELOPMENT:
        return 'Flutter Boilerplate Development';
      default:
        return 'title';
    }
  }
}
