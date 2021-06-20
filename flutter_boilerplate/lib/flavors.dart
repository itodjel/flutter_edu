enum Flavor {
  production,
  staging,
  development,
}

class F {
  static late Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Flutter Boilerplate';
      case Flavor.staging:
        return 'Flutter Boilerplate Staging';
      case Flavor.development:
        return 'Flutter Boilerplate Development';
      default:
        return 'title';
    }
  }
}
