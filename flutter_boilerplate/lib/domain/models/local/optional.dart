class Optional<T> {
  T? _value;
  T? get value => _value;

  Optional(T? value) {
    _value = value;
  }

  Optional.absent() {
    _value = null;
  }
}
