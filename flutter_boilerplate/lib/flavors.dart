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
        return 'Tailgreeter';
      case Flavor.staging:
        return 'Tailgreeter Staging';
      case Flavor.evaluation:
        return 'Tailgreeter Evaluation';
      case Flavor.development:
        return 'Tailgreeter Development';
      default:
        return '';
    }
  }
}
