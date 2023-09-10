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

  test('制約内', () {
    expect(no2.reversi('L'), [2, 1]);
    expect(no2.reversi('L' * 1000), [0, 1002]);
  });

  test('制約外', () {
    expect(() => no2.reversi(''), throwsArgumentError);
    expect(() => no2.reversi('L' * 1001), throwsArgumentError);
  });
}
