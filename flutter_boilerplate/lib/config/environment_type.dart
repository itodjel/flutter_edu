enum EnvironmentType {
  development,
  evaluation,
  staging,
  production,
}

extension EnvironmentTypeExtension on EnvironmentType {
  bool get isDevelopment => this == EnvironmentType.development;
  bool get isTest => this == EnvironmentType.evaluation;
  bool get isStaging => this == EnvironmentType.staging;
  bool get isProduction => this == EnvironmentType.production;

  String getName() {
    switch (this) {
      case EnvironmentType.development:
        return 'Development';
      case EnvironmentType.evaluation:
        return 'Test';
      case EnvironmentType.staging:
        return 'Staging';
      case EnvironmentType.production:
        return '';
      default:
        return '';
    }
  }
}
