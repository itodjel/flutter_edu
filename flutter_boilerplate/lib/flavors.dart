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
        return 'FB';
      case Flavor.STAGING:
        return 'FB Staging';
      case Flavor.DEVELOPMENT:
        return 'FB Development';
      default:
        return 'title';
    }
  }
}
