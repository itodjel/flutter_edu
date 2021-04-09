enum EnvironmentType {
  development,
  test,
  staging,
  production,
}

extension EnvironmentTypeExtension on EnvironmentType {
  String getName() {
    switch (this) {
      case EnvironmentType.development:
        return 'Development';
      case EnvironmentType.test:
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
