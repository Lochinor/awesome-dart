extension BoolExtensions on bool {
  bool not() {
    return !this;
  }

  bool and(bool value) {
    return this && value;
  }

  bool or(bool value) {
    return this || value;
  }
}
