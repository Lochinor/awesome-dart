/// 类似Kotlin的扩展
extension Standard<T> on T {
  T apply(void Function(T self) block) {
    block(this);
    return this;
  }

  R let<R>(R Function(T value) block) => block(this);

  bool test(bool Function(T value) predicate) => predicate(this);

  T? takeIf(bool Function(T value) predicate) {
    return predicate(this) ? this : null;
  }

  T? takeUnless(bool Function(T value) predicate) {
    return predicate(this) ? null : this;
  }

  bool isNull() => (this == null);
}
