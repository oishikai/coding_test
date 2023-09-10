import 'dart:io';

void main() {
  final S = stdin.readLineSync()!;
  try {
    final result = reversi(S);
    print(result.join(' '));
  } catch (e) {
    print(e);
  }
}

enum Stone {
  black,
  white,
}

List<int> reversi(String S) {
  // LとR以外の文字が含まれている場合
  if (S.replaceAll('L', '').replaceAll('R', '').isNotEmpty) throw ArgumentError('LとR以外の文字が含まれています');

  // 碁盤
  List<Stone> stoneLine = [Stone.black, Stone.white];

  for (int i = 0; i < S.length; i++) {
    final hand = S[i];
    Stone turn;

    // 偶数番目の手番は黒、奇数番目の手番は白
    turn = i.isEven ? Stone.black : Stone.white;

    // 盤上の石がすべてturnと異なる色の場合、先頭または末尾に石を追加して次の手番へ
    if (countStones(stoneLine, turn) == 0) {
      if (hand == 'L') {
        stoneLine.insert(0, turn);
      } else {
        stoneLine.add(turn);
      }
      continue;
    }

    if (hand == 'L') {
      // 右隣(打つ前の左端)が異なる色の場合、全てturnと同じ色にひっくり返し、turnを先頭に加える
      if (stoneLine[0] != turn) stoneLine = turnOver(turn, stoneLine.length);
      stoneLine.insert(0, turn);
    } else {
      // 左隣(打つ前の右端)が異なる色の場合、全てturnと同じ色にひっくり返し、turnを末尾に加える
      if (stoneLine[stoneLine.length - 1] != turn) stoneLine = turnOver(turn, stoneLine.length);
      stoneLine.add(turn);
    }
  }

  final blackCount = countStones(stoneLine, Stone.black);
  final whiteCount = countStones(stoneLine, Stone.white);

  return [blackCount, whiteCount];
}

// 要素数lengthの配列で要素がすべてstoneのList<Stone>を返す
List<Stone> turnOver(Stone stone, int length) {
  List<Stone> turnedList = [];

  for (int i = 0; i < length; i++) {
    turnedList.add(stone);
  }

  return turnedList;
}

int countStones(List<Stone> list, Stone stone) {
  return list.where((Stone value) => value == stone).toList().length;
}
