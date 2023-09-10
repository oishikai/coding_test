import 'package:test/test.dart';

import '../bin/no_2.dart' as no2;

void main() {
  test('サンプルテスト', () {
    expect(no2.reversi('RRLL'), [0, 6]);
    expect(no2.reversi('LLRLRLR'), [3, 6]);
  });

  test('不正な入力', () {
    expect(() => no2.reversi('LLRLRLRM'), throwsArgumentError);
    expect(() => no2.reversi('ABab'), throwsArgumentError);
  });
}
