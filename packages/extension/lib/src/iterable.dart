extension IterableExt<T> on Iterable<T> {

  Iterable<R> mapNotNull<R>(R? Function(T element) transform) {
    return map(transform).whereType();
  }

  bool all(bool Function(T element) predicate) {
    for (T element in this) {
      if (!predicate(element)) return false;
    }
    return true;
  }

  int count(bool Function(T element) predicate) {
    int count = 0;
    for (T element in this) {
      if (predicate(element)) count++;
    }
    return count;
  }
}