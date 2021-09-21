extension IntExtensions on int? {
  bool between(int min, int max) => this != null && this! >= min && this! <= max;
  int get valueForDividend => this == 0 ? 1 : value;
  int get value => this ?? 0;
  bool isInRange(int min, int max) => this != null && this! >= min && this! <= max;
}
