import 'dart:io';

void main() {
  final a = stdin.readLineSync()!;

  try {
    final min = calculateMinRolls(a);
    print(min);
  } catch (e) {
    print(e);
  }
}

int calculateMinRolls(String A) {
  // 数字以外の文字が含まれている場合
  if (int.tryParse(A) == null) throw ArgumentError('数字以外の文字が含まれています');
  int a = int.parse(A);

  // 制約外の場合
  if (a < 2 || 100000 < a) throw ArgumentError('2以上100000以下の整数を入力してください');

  // 初期位置を考慮して-1
  a = a - 1;

  if (a % 6 == 0) {
    return a ~/ 6;
  }
  return (a ~/ 6) + 1;
}
