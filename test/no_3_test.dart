import 'package:test/test.dart';

import '../bin/no_3.dart' as no3;

void main() {
  test('サンプルテスト', () {
    expect(no3.findMinPermutation('201'), '102');
    expect(no3.findMinPermutation('12212122212222'), '11112222222222');
  });

  test('不正な入力', () {
    expect(() => no3.findMinPermutation('123Abc'), throwsArgumentError);
  });

  test('n=1(1桁)の場合', () {
    expect(no3.findMinPermutation('0'), '0');
    expect(no3.findMinPermutation('1'), '1');
    expect(no3.findMinPermutation('2'), '2');
    expect(no3.findMinPermutation('3'), '3');
    expect(no3.findMinPermutation('4'), '4');
    expect(no3.findMinPermutation('5'), '5');
    expect(no3.findMinPermutation('6'), '6');
    expect(no3.findMinPermutation('7'), '7');
    expect(no3.findMinPermutation('8'), '8');
    expect(no3.findMinPermutation('9'), '9');
  });

  test('n=100(100桁)の場合', () {
    expect(no3.findMinPermutation('0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999'), '1000000000011111111122222222223333333333444444444455555555556666666666777777777788888888889999999999');
  });
}
