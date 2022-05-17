extension AppBoolNullableExtensions on bool? {
  bool get value => this ?? false;
}
