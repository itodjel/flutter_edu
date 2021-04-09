extension IntegerExtensions on int {
  bool isInRange(int min, int max) => (this != null && this >= min && this <= max);
  int getValueOrDefault() => this ?? 0;
  int getValueOrDefaultForDividend() => (this ?? 0) == 0 ? 1 : (this ?? 0);
}
