import 'dart:async';

import 'package:okx/okx.dart';

String channel = 'l';

List<String> list = ['abc', 'dev'];

int? time;

late int lazy = () {
  print('lazy init');
  return 1;
}();

void main() async {
  print('main start');
  test2();
  print('==================');
  time = 5;
  test2();
  print('main end');

  App().test((o) => false);
  Standard(App()).test((x) => false);

  print('lazy ${lazy}');
  print('lazy2 ${lazy}');

  bool b = time.takeUnless((t) => t == null || t < 0).isNull();
  print(b);
}

void test2() async {
  time = time?.let<int?>((t) {
    print('test2 let: $time');
    return t - 1;
  })?.apply((t) async {
    print('test2 apply ${t} t = ${t.isEven}');
    print('test2 apply: ${time}');
  });

  print('test2: $time');
}

void test1() async {
  channel = await list.first.let((s) async {
    print('apply 1');
    print('delayed before: $channel');
    await Future.delayed(Duration(seconds: 1));
    print('delayed: $channel');
    return s;
  });

  print(channel.test((s) {
    return s.isNotEmpty;
  }));

  channel.let((s) async {
    return s.test((s) {
      return s.isNotEmpty;
    });
  });

  bool empty = await channel.let((s) async {
    await Future.delayed(Duration(seconds: 1));
    return s.isEmpty;
  });
  print(empty);
}

class App {
  bool test(bool Function(Object) predicate) => predicate(this);
}
