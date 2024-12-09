import 'dart:math';
import 'dart:io';

class Monster {
  String name1; //몹이름
  int h; //체력
  int a; //공
  int b; //방

  Monster(this.name1, this.h, this.a, this.b) {
    a = max(Random().nextInt(a) + 1, b);
  }

  ///NEXTINT는 내가 지정한 몹 공격력에 -1한 값중 랜덤으로 지정해줌 그래서 뒤쪽에 +1한거임 ㅋㅋㅋ 원래 공격력 맞출라고 ㅋㅋㅋ

  void Attack(Character c) {
    /// 캐릭은 변수이름 c
    int Attack2 = max(a - c.B2, 0); // 최소 데미지 0
    c.H2 -= Attack2;
    print('$name1이(가) ${c.name2}에게 $Attack2의 피해를 입혔습니다!');

    ///몹이 플레이어에게 주는 데미지 의 메서드가 값을  반환

    ///캐릭이 맞았을때 출력
  }

  void State1() {
    //몹 상태
    print('몬스터: $name1, 체력: $h, 공격력: $a'); //몹 이름,체,공,방
  }

  bool die() => h <= 0;

  ///몹 죽었는지 확인
}

class Character {
  String name2; //캐릭터이름
  int H2; //체
  int A2; //공
  int B2; //방

  Character(this.name2, this.H2, this.A2, this.B2) {
    A2 = max(Random().nextInt(A2) + 1, B2); //최대값 안에 랜덤을 돌려서 나온 값이 유저 딜임 ㅋㅋ
  }

  static String Ename() {
    //이름입력 변수 이름 Ename
    final Pname =
        RegExp(r'^[가-힣a-zA-Z]+$'); // 허용 문자: 한글, 영문 대소문자,이름 패턴 변수 이름Pname
    String? ename1; //플레이어가 입력한 이름의 변수 이름 ename1

    while (true) {
      print("플레이어의 이름을 입력하세요 (한글 또는 영문 대소문자만 허용):");
      ename1 = stdin.readLineSync();

      if (ename1 == null || ename1.isEmpty) {
        print("이름은 빈 문자열일 수 없습니다. 다시 입력해주세요."); // 이름이 비어 있는 경우 메시지 출력
      } else if (!Pname.hasMatch(ename1)) {
        print(
            "이름에 특수 문자나 숫자는 포함될 수 없습니다. 다시 입력해주세요."); // 유효하지 않은 문자 포함 시 메시지 출력
      } else {
        break; // 유효한 이름 입력 시 루프 종료
      }
    }
    return ename1; // 유효한 이름 반환
  }

  bool run() {
    ///방어를 도주로 바꿈
    print('$name2이(가) 도망쳤습니다! 전투가 종료됩니다.');
    return true; // 도주 시 true 반환
  }

  void State2() {
    //유저상태출력
    print('플레이어: $name2, 체력: $H2, 공격력: $A2, 방어력: $B2');
  }

  void Attack2(Monster M) {
    int Character = max(A2 - M.b, 0); // 최소 데미지 0
    M.h -= Character;
    print('$name2(가) ${M.name1}에게 $Character 의 피해를 입혔습니다!');
  }

  void drain(Monster monster) {
    print('${monster.name1}의 능력치를 흡수합니다.');
  }

  void saveResult(Character user, String result) {
    print("결과를 저장하시겠습니까? (y/n)");
    String? input = stdin.readLineSync();

    if (input != null && input.toLowerCase() == 'y') {
      final file = File('result.txt');
      file.writeAsStringSync('플레이어 이름: ${user.name2}\n');
      file.writeAsStringSync('남은 체력: ${user.H2}\n', mode: FileMode.append);
      file.writeAsStringSync('게임 결과: $result\n', mode: FileMode.append);
      print("결과가 result.txt에 저장되었습니다.");
    } else {
      print("결과를 저장하지 않았습니다.");
    }
  }
}

void main() {
  String pname2 = Character.Ename();
  Character user = Character(pname2, 100, 10, 10); //// 캐릭터의 변수 이름 유저

  List<Monster> listm = [
    Monster("고블린", 50, 15, 5),
    Monster("오크", 80, 20, 8),
    Monster("트롤", 100, 25, 10),
    Monster("늑대", 40, 12, 3),
    Monster("스켈레톤", 60, 18, 6),
    Monster("임프", 30, 10, 4),
    Monster("좀비", 70, 15, 7),
    Monster("베어", 90, 22, 8),
    Monster("하피", 50, 16, 5),
    Monster("골렘", 120, 30, 15),
    Monster("괴물눈", 40, 12, 3),
    Monster("늑대인간", 110, 28, 12),
    Monster("라이칸스로프", 100, 25, 10),
    Monster("슬라임", 30, 8, 2),
    Monster("미믹", 70, 20, 10)
  ];

  while (listm.isNotEmpty && user.H2 > 0) {
    // 랜덤 몬스터 선택
    Monster m2 = listm[Random().nextInt(listm.length)];

    print("\n=== ${m2.name1}이(가) 나타났습니다! ===");

    // 전투 루프: 한쪽이 죽을 때까지 진행
    while (listm.isNotEmpty && user.H2 > 0) {
      Monster m2 = listm[Random().nextInt(listm.length)]; // 랜덤으로 몬스터 선택

      print("\n=== ${m2.name1}이(가) 나타났습니다! ===");

      print("행동을 선택하세요: 공격하기(1), 도망가기(2)");
      String? C1 = stdin.readLineSync();

      if (C1 == '1') {
        // 전투 루프: 몬스터가 쓰러질 때까지 싸움
        while (!m2.die() && user.H2 > 0) {
          // 플레이어 공격
          user.Attack2(m2);
          if (m2.die()) {
            print('${m2.name1}을(를) 쓰러뜨렸습니다!');
            user.drain(m2); // 몬스터 능력치 흡수
            listm.remove(m2); // 리스트에서 제거
            break; // 전투 종료
          }

          // 몬스터 공격
          print("\n=== ${m2.name1}의 턴 ===");
          m2.Attack(user);
          if (user.H2 <= 0) {
            print("${user.name2}이(가) 쓰러졌습니다...");
            user.saveResult(user, "패배"); // 패배 시 결과 저장 호출
            return; // 게임 종료
          }
        }
      } else if (C1 == '2') {
        // 도망
        if (user.run()) {
          print("전장에서 도망쳤습니다!");
          return; // 게임 종료
        }
      } else {
        print("잘못된 선택입니다. 다시 선택해주세요.");
        continue;
      }

      // 다음 몬스터와 대결 여부
      if (listm.isNotEmpty) {
        while (true) {
          print("다음 몬스터와 대결하시겠습니까? (y/n)");
          String? choice = stdin.readLineSync();

          if (choice == null || choice.toLowerCase() == 'n') {
            print("게임이 종료되었습니다.");
            return; // 게임 종료
          } else if (choice.toLowerCase() == 'y') {
            break; // 다음 전투 진행
          } else {
            print("잘못된 입력입니다. 다시 입력해주세요.");
          }
        }
      }
    }

    print("\n게임종료");
  }
}
