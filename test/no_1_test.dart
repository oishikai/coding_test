import 'package:test/test.dart';

import '../bin/no_1.dart' as no1;

void main() {
  test('サンプルテスト', () {
    expect(no1.calculateMinRolls('10'), 2);
    expect(no1.calculateMinRolls('13'), 2);
  });

  test('不正な入力', () {
    expect(() => no1.calculateMinRolls('1A'), throwsArgumentError);
  });

  test('下限:2', () {
    expect(no1.calculateMinRolls('2'), 1);
  });

  test('2より小さい', () {
    expect(() => no1.calculateMinRolls('1'), throwsArgumentError);
  });

  test('上限:100000', () {
    expect(no1.calculateMinRolls('100000'), 16667);
  });

  test('100000より大きい', () {
    expect(() => no1.calculateMinRolls('100001'), throwsArgumentError);
  });
}
