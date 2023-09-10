import 'dart:io';

void main() {
  String input = stdin.readLineSync()!.trim();

  try {
    String result = findMinPermutation(input);
    print(result);
  } catch (e) {
    print(e);
  }
}

String findMinPermutation(String input) {
  if (RegExp(r'[^0-9]').hasMatch(input)) throw ArgumentError('数字以外の文字が含まれています');
  List<int> digits = input.split('').map(int.parse).toList();
  // 昇順にソート
  digits.sort();

  for (int i = 0; i < digits.length; i++) {
    if (digits[i] != 0) {
      // 先頭の数字が0でない場合、それを最初の桁に配置
      digits.insert(0, digits.removeAt(i));
      break;
    }
  }

  // 数字のリストを文字列に変換
  String result = digits.join();
  return result;
}
