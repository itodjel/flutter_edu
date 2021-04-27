extension IntegerExtensions on int {
  bool between(int min, int max) => this >= min && this <= max;
  int getValueOrDefaultForDividend() => this == 0 ? 1 : 0;
}
