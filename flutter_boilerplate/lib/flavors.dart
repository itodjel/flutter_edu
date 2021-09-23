enum Flavor {
  production,
  staging,
  evaluation,
  development,
}

class F {
  static Flavor appFlavor = Flavor.production;

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'FlutterBoilerplate';
      case Flavor.staging:
        return 'FlutterBoilerplate Staging';
      case Flavor.evaluation:
        return 'FlutterBoilerplate Evaluation';
      case Flavor.development:
        return 'FlutterBoilerplate Development';
      default:
        return '';
    }
  }
}
