import 'package:flutter_boilerplate/_all.dart';

extension DoubleExtensions on double {
  int getDecimals([int precision = 2]) {
    final parts = toStringAsFixed(precision).split(RegExp('[,.]+'));
    return parts.count() > 1 ? int.parse(parts.last) : 0;
  }
}
