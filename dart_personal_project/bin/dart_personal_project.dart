import 'dart:io';

class Student {
  String name;
  int score;

  Student(this.name, this.score);
}

void main() {
  List<Student> students = [];
  while (true) {
    print("\n학생 성적 관리 프로그램");
    print("1. 학생 추가");
    print("2. 학생 목록 출력");
    print("3. 평균 점수 계산");
    print("4. 종료");
    stdout.write("메뉴를 선택하세요: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        addStudent(students);
        break;
      case '2':
        printStudentList(students);
        break;
      case '3':
        calculateAverage(students);
        break;
      case '4':
        print("프로그램을 종료합니다.");
        return;
      default:
        print("올바른 메뉴를 선택하세요.");
    }
  }
}

void addStudent(List<Student> students) {
  stdout.write("학생 이름을 입력하세요: ");
  String? name = stdin.readLineSync();
  stdout.write("학생 점수를 입력하세요: ");
  String? scoreInput = stdin.readLineSync();
  if (name != null && scoreInput != null) {
    try {
      int score = int.parse(scoreInput);
      students.add(Student(name, score));
      print("$name 학생이 추가되었습니다.");
    } catch (e) {
      print("점수는 숫자로 입력해야 합니다.");
    }
  } else {
    print("입력이 유효하지 않습니다.");
  }
}

void printStudentList(List<Student> students) {
  if (students.isEmpty) {
    print("등록된 학생이 없습니다.");
  } else {
    print("학생 목록:");
    for (int i = 0; i < students.length; i++) {
      print("${i + 1}. ${students[i].name} - ${students[i].score}점");
    }
  }
}

void calculateAverage(List<Student> students) {
  if (students.isEmpty) {
    print("등록된 학생이 없습니다.");
  } else {
    double totalScore = students.fold(0, (sum, student) => sum + student.score);
    double average = totalScore / students.length;
    print("평균 점수: ${average.toStringAsFixed(1)}");
  }
}
