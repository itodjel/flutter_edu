class Pagination {
  late int skip;
  late int take;
  int get page => (skip ~/ take) + 1;

  late int _skip;
  late int _take;

  Pagination({
    int? skip,
    int? take,
  }) {
    this.skip = _skip = skip ?? 1;
    this.take = _take = take ?? 10;
  }

  void reset() {
    skip = _skip;
    take = _take;
  }

  void increment() => skip += take;

  void decrement() => skip -= take;

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': take,
    };
  }
}
