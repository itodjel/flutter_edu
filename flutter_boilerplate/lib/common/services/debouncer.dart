import 'package:easy_debounce/easy_debounce.dart';

abstract class IDebouncer {
  void debounce(
    Function() onExecute, [
    Duration duration,
    String tag,
  ]);
}

class Debouncer implements IDebouncer {
  @override
  void debounce(
    Function() onExecute, [
    Duration duration = const Duration(milliseconds: 500),
    String tag = 'common-debouncer',
  ]) {
    EasyDebounce.debounce(
      tag,
      duration,
      onExecute,
    );
  }
}
