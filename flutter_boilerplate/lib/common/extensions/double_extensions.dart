import 'package:tfm/all.dart';

extension DoubleExtensions on double {
  double getValueOrDefault() => this ?? 0.0;
  int getDecimals([int precision = 2]) {
    final parts = this.toStringAsFixed(precision).split(RegExp('[,.]+'));
    return parts.count() > 1 ? int.parse(parts.last) : null;
  }
}
