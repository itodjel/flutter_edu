import 'package:tfm/all.dart';

extension FormStateExtensions on FormState {
  Future ifValid(Function callback) {
    if (validate() && callback != null) {
      callback();
    }
  }
}
