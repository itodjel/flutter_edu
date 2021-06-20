extension ListExtensions<T> on List<T> {
  void addIf(bool condition, T element, [Function(T)? callbackIfTrue]) {
    if (condition) {
      add(element);
      if (callbackIfTrue != null) {
        callbackIfTrue(element);
      }
    }
  }

  int toggle(T element, [bool Function(T element)? test]) {
    final alreadyAdded = test != null ? firstOrDefault(test) != null : contains(element);

    if (alreadyAdded) {
      test != null ? removeWhere(test) : remove(element);
    } else {
      add(element);
    }

    return alreadyAdded ? -1 : 1;
  }
}

extension IterableExtensions<T> on Iterable<T> {
  bool hasItems() => count() > 0;

  bool isNullOrEmpty() => isEmpty;

  bool isNotNullOrEmpty() => !isNullOrEmpty();

  int count() => isNullOrEmpty() ? 0 : length;

  T firstOrDefault([bool Function(T element)? test]) => test != null ? firstWhere(test) : firstWhere((element) => true);

  Iterable<U> mapIndexed<U>(U Function(int index, dynamic item) f) sync* {
    var index = 0;

    for (final item in this) {
      yield f(index, item);
      index++;
    }
  }
}
