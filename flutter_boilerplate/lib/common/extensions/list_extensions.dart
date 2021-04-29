extension ListExtensions<T> on List<T> {
  void addIf(bool condition, T element, [Function(T)? callbackIfTrue]) {
    if (condition) {
      add(element);
      if (callbackIfTrue != null) {
        callbackIfTrue(element);
      }
    }
  }

  int toggle(T element, [bool test(T element)?]) {
    final alreadyAdded = test != null ? this.firstOrDefault(test) != null : this.contains(element);

    if (alreadyAdded) {
      test != null ? this.removeWhere(test) : this.remove(element);
    } else {
      this.add(element);
    }

    return alreadyAdded ? -1 : 1;
  }
}

extension IterableExtensions<T> on Iterable<T> {
  bool hasItems() => count() > 0;

  bool isNullOrEmpty() => this == null || isEmpty;

  bool isNotNullOrEmpty() => !isNullOrEmpty();

  int count() => isNullOrEmpty() ? 0 : length;

  T firstOrDefault([bool test(T element)?]) => test != null ? this.firstWhere(test) : this.firstWhere((T element) => true);

  Iterable<T> mapIndexed<T>(T Function(int index, dynamic item) f) sync* {
    var index = 0;

    for (final item in this) {
      yield f(index, item);
      index++;
    }
  }
}
