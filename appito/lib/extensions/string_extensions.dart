extension AppStringNullableExtensions on String? {
  String get value => this ?? '';
  bool get hasValue => value.isNotEmpty;
}
