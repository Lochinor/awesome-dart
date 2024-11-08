[![okx](https://img.shields.io/pub/v/okx?label=okx)](https://pub.dev/packages/okx)

## Getting started 🎉
Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  okx: any
```

## Usage
After you import the library, you can use the extensions.

```dart
import 'package:okx/okx.dart';
```

### Standard

```dart
void _stdUsage(String? str) async {
  // let
  int length = str.let((s) {
    if (s == null || s.isEmpty) {
      return 0;
    }
    return s.length;
  });

  // async
  bool b = await str.let((s) async {
    await Future.delayed(Duration(seconds: 1));
    return s == null || s.isEmpty;
  });

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

  // takeUnless
  String s2 = str.takeIf((s) => s == null || s.isEmpty) ?? 'default';

  // isNull
  print(str.isNull());
}

```
### int
```dart
void _intUsage(int i) {
  i.repeat((index) {
    print(index);
  });
}
```

### iterable
```dart
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
```

### bool
```dart
void _boolUsage() {
  print(true.or(false));
  print(true.and(false));
  print(true.not());
}
```

## License
```text
BSD 3-Clause License

Copyright (c) 2024, Shihwan

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

```