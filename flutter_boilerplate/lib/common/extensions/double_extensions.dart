extension DoubleExtensions on double {
  int getDecimals([int precision = 2]) {
    final parts = toStringAsFixed(precision).split(RegExp('[,.]+'));
    return parts.length > 1 ? int.parse(parts.last) : 0;
  }

  String toPrice([int numberOfDecimals = 2]) => this - floor() == 0 ? toStringAsFixed(0) : toStringAsFixed(numberOfDecimals);
}

extension DoubleNullableExtensions on double? {
  double get value => this ?? 0;
  String toPrice([int numberOfDecimals = 2]) => this != null ? (this! - this!.floor() == 0 ? this!.toStringAsFixed(0) : this!.toStringAsFixed(numberOfDecimals)) : '';
}
