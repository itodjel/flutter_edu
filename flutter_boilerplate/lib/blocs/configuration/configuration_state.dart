import 'package:flutter_boilerplate/_all.dart';

enum ConfigurationStateStatus {
  initializing,
  initialized,
}

class ConfigurationState {
  ConfigurationStateStatus status;
  Configuration configuration;

  ConfigurationState({
    required this.status,
    required this.configuration,
  });

  ConfigurationState copyWith({
    ConfigurationStateStatus? status,
    Configuration? configuration,
  }) =>
      ConfigurationState(
        status: status ?? this.status,
        configuration: configuration ?? this.configuration,
      );
}
