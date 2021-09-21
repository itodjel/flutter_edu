class ExceptionReportingSettings {
  final String slackWebHookUrl;
  final String slackChannel;
  final bool enableDeviceParameters;
  final bool enableApplicationParameters;
  final bool enableCustomParameters;
  final bool enableStackTrace;
  final bool printLogs;

  const ExceptionReportingSettings({
    this.slackWebHookUrl = '',
    this.slackChannel = '',
    this.enableDeviceParameters = false,
    this.enableApplicationParameters = false,
    this.enableCustomParameters = false,
    this.enableStackTrace = false,
    this.printLogs = false,
  });
}
