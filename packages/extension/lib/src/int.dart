extension IntExtensions on int {
  void repeat(Function(int index) action) {
    for (int i = 0; i < this; i++) {
      action(i);
    }
  }
}
