import 'package:catcher/handlers/slack_handler.dart';
import 'package:catcher/model/platform_type.dart';
import 'package:catcher/utils/catcher_utils.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:flutter_boilerplate/_all.dart';

class ExtendedSlackHandler extends SlackHandler {
  final Dio _dio = Dio();
  final FutureOr<String> Function(String message)? extendMessage;

  ExtendedSlackHandler(
    String webhookUrl,
    String channel, {
    String username = 'Catcher',
    String iconEmoji = ':bangbang:',
    bool printLogs = false,
    bool enableDeviceParameters = false,
    bool enableApplicationParameters = false,
    bool enableStackTrace = false,
    bool enableCustomParameters = false,
    this.extendMessage,
  }) : super(
          webhookUrl,
          channel,
          username: username,
          iconEmoji: iconEmoji,
          printLogs: printLogs,
          enableDeviceParameters: enableDeviceParameters,
          enableApplicationParameters: enableApplicationParameters,
          enableStackTrace: enableStackTrace,
          enableCustomParameters: enableCustomParameters,
        );

  @override
  Future<bool> handle(Report report, BuildContext? context) async {
    try {
      if (!(await CatcherUtils.isInternetConnectionAvailable())) {
        _printLog('No internet connection available');
        return false;
      }

      final String defaultMessage = _buildMessage(report);

      final String message = extendMessage != null ? await extendMessage!(defaultMessage) : defaultMessage;

      final data = {'text': message, 'channel': channel, 'username': username, 'icon_emoji': iconEmoji};
      _printLog('Sending request to Slack server...');
      final Response response = await _dio.post<dynamic>(webhookUrl, data: data);
      _printLog('Server responded with code: ${response.statusCode} and message: ${response.statusMessage}');
      final statusCode = response.statusCode ?? 0;
      return statusCode >= 200 && statusCode < 300;
    } catch (exception) {
      _printLog('Failed to send slack message: $exception');
      return false;
    }
  }

  String _buildMessage(Report report) {
    final StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write('*Error:* ```${report.error}```\n');
    if (enableStackTrace) {
      stringBuffer.write('*Stack trace:* ```${report.stackTrace}```\n');
    }
    if (enableDeviceParameters && report.deviceParameters.isNotEmpty) {
      stringBuffer.write('*Device parameters:* ```');
      for (final entry in report.deviceParameters.entries) {
        stringBuffer.write('${entry.key}: ${entry.value}\n');
      }
      stringBuffer.write('```\n');
    }

    if (enableApplicationParameters && report.applicationParameters.isNotEmpty) {
      stringBuffer.write('*Application parameters:* ```');
      for (final entry in report.applicationParameters.entries) {
        stringBuffer.write('${entry.key}: ${entry.value}\n');
      }
      stringBuffer.write('```\n');
    }

    if (enableCustomParameters && report.customParameters.isNotEmpty) {
      stringBuffer.write('*Custom parameters:* ```');
      for (final entry in report.customParameters.entries) {
        stringBuffer.write('${entry.key}: ${entry.value}\n');
      }
      stringBuffer.write('```\n');
    }

    return stringBuffer.toString();
  }

  void _printLog(String log) {
    if (printLogs) {
      logger.info(log);
    }
  }

  @override
  List<PlatformType> getSupportedPlatforms() => [
        PlatformType.android,
        PlatformType.iOS,
        PlatformType.web,
        PlatformType.linux,
        PlatformType.macOS,
        PlatformType.windows,
      ];
}
