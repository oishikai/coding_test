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

  test('制約内', () {
    expect(no1.calculateMinRolls('2'), 1);
    expect(no1.calculateMinRolls('100000'), 16667);
  });

  test('制約外', () {
    expect(() => no1.calculateMinRolls('1'), throwsArgumentError);
    expect(() => no1.calculateMinRolls('100001'), throwsArgumentError);
  });
}
