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
  print('===== standard usage =====');
  await _stdUsage(null);
  await _stdUsage('okx');
  print('===== int usage =====');
  _intUsage(3);
  print('===== iterable usage =====');
  _iterableUsage();
  print('===== bool usage =====');
  _boolUsage(true, true);
  _boolUsage(true, false);
  _boolUsage(false, false);
  _boolUsage(false, true);
}

Future<void> _stdUsage(String? str) async {
  // let
  int length = str.let((s) {
    if (s == null || s.isEmpty) {
      return 0;
    }
    return s.length;
  });
  print(length);

  // async
  bool b = await str.let((s) async {
    await Future.delayed(Duration(seconds: 1));
    return s == null || s.isEmpty;
  });
  print(b);

  // apply
  str?.apply((s) {
    print(s);
  });

  // test
  if (str.test((s) => s != null && s.isNotEmpty)) {
    print('Not Empty');
  }

  // takeIf
  String s1 = str.takeIf((s) => s != null && s.isNotEmpty) ?? 'default';
  print(s1);

  // takeUnless
  String s2 = str.takeIf((s) => s == null || s.isEmpty) ?? 'default';
  print(s2);

  // isNull
  print(str.isNull());
}

void _intUsage(int i) {
  i.repeat((index) {
    print(index);
  });
}

void _iterableUsage() {
  List<String> list = ['1', null, '2', 'abc', 'def'].mapNotNull((e) {
    return e == null || e.length == 1 ? null : e;
  }).toList();
  // [abc, def]
  print(list);

  bool all = ['a', 'b', 'c'].all((e) => e.length == 1);
  // true
  print(all);
  // true
  print([].all((e) => e == null, onEmpty: true));
  // false
  print([].all((e) => e == null, onEmpty: false));

  int count = ['abc', '123', 'a1'].count((e) => e.length == 3);
  // 2
  print(count);
}

void _boolUsage(bool a, bool b) {
  print("$a or $b: ${a.or(b)}");
  print("$a and $b: ${a.and(b)}");
  print("$a not: ${a.not()}");
}
