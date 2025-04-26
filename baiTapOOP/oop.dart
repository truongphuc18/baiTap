import 'dart:io';

/**
 * Quản lý trường học
Mô tả bài toán:
Viết một hệ thống quản lý trường học với chức năng quản lý giáo viên, học sinh, và lớp học.
Yêu cầu chi tiết:
1. Lớp Person:
○ Thuộc tính: id, name, age, gender.
○ Là lớp cha cho các lớp con: Student và Teacher.
2. Lớp Student:
○ Kế thừa từ Person.
○ Thuộc tính riêng: grade (lớp học), score.
○ Phương thức: hiển thị thông tin sinh viên.
3. Lớp Teacher:
○ Kế thừa từ Person.
○ Thuộc tính riêng: subject, salary.
○ Phương thức: hiển thị thông tin giáo viên.
4. Lớp Classroom:
○ Thuộc tính: id, name, students, teacher.
○ Phương thức:
■ Thêm học sinh vào lớp.
■ Gán giáo viên phụ trách lớp.
■ Hiển thị thông tin lớp học.
5. Chức năng chính:
○ Quản lý danh sách học sinh và giáo viên.
○ Tính điểm trung bình của từng học sinh.
○ Gán giáo viên và học sinh vào lớp học.
○ Hiển thị báo cáo danh sách lớp và điểm số
 */

void main() {
  List<Teacher> teachers = [];
  List<Student> students = [];
  List<Classroom> classrooms = [];

  while (true) {
    print("\nChọn chức năng:");
    print("1. Thêm giáo viên");
    print("2. Thêm học sinh");
    print("3. Tạo lớp học");
    print("4. Gán giáo viên vào lớp");
    print("5. Thêm học sinh vào lớp");
    print("6. Hiển thị thông tin lớp học");
    print("7. Thoát");
    stdout.write("Lựa chọn: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        stdout.write("Nhập ID giáo viên: ");
        var id = stdin.readLineSync();
        stdout.write("Nhập tên: ");
        String? name = stdin.readLineSync();
        stdout.write("Nhập tuổi: ");
        int age = int.parse(stdin.readLineSync()!);
        stdout.write("Nhập giới tính: ");
        String? gender = stdin.readLineSync();
        stdout.write("Nhập môn dạy: ");
        String? subject = stdin.readLineSync();
        stdout.write("Nhập lương: ");
        double salary = double.parse(stdin.readLineSync()!);
        teachers.add(Teacher(id, name!, age, gender!, subject!, salary));
        print("\nGiáo viên đã được thêm!");
        break;

      case "2":
        stdout.write("Nhập ID học sinh: ");
        var id = stdin.readLineSync();
        stdout.write("Nhập tên: ");
        String? name = stdin.readLineSync();
        stdout.write("Nhập tuổi: ");
        int age = int.parse(stdin.readLineSync()!);
        stdout.write("Nhập giới tính: ");
        String? gender = stdin.readLineSync();
        stdout.write("Nhập lớp: ");
        String? grade = stdin.readLineSync();
        students.add(Student(id, name!, age, gender!, grade!, []));
        print("\nHọc sinh đã được thêm!");
        break;

      case "3":
        stdout.write("Nhập ID lớp học: ");
        var id = stdin.readLineSync();
        stdout.write("Nhập tên lớp học: ");
        String? name = stdin.readLineSync();
        classrooms.add(Classroom(id, name!));
        print("\nLớp học đã được tạo!");
        break;

      case "4":
        if (classrooms.isEmpty || teachers.isEmpty) {
          print("Không có lớp học hoặc giáo viên để gán!");
          break;
        }
        stdout.write("Nhập ID lớp học: ");
        var id = stdin.readLineSync();
        Classroom? classroom = classrooms.firstWhere((c) => c.id == id,
            orElse: () => Classroom("-1", ""));
        if (classroom.id == "-1") {
          print("Lớp học không tồn tại!");
          break;
        }
        stdout.write("Nhập ID giáo viên: ");
        var teacherId = stdin.readLineSync();
        Teacher? teacher = teachers.firstWhere((t) => t.id == teacherId,
            orElse: () => Teacher("-1", "", 0, "", "", 0));
        if (teacher.id == "-1") {
          print("Giáo viên không tồn tại!");
          break;
        }
        classroom.ganGV(teacher);
        print("\nGiáo viên đã được gán vào lớp!");
        break;
      case "5":
        if (classrooms.isEmpty || students.isEmpty) {
          print("Không có lớp học hoặc học sinh để thêm!");
          break;
        }
        stdout.write("Nhập ID lớp học: ");
        var id = stdin.readLineSync();
        Classroom? classroom = classrooms.firstWhere((c) => c.id == id,
            orElse: () => Classroom("-1", ""));
        if (classroom.id == "-1") {
          print("Lớp học không tồn tại!");
          break;
        }
        stdout.write("Nhập ID học sinh: ");
        var studentId = stdin.readLineSync();
        Student? student = students.firstWhere((s) => s.id == studentId,
            orElse: () => Student("-1", "", 0, "", "", []));
        if (student.id == "-1") {
          print("Học sinh không tồn tại!");
          break;
        }
        classroom.addStudent(student);
        print("\nHọc sinh đã được thêm vào lớp!");
        break;

      case "6":
        stdout.write("Nhập ID lớp học: ");
        var id = stdin.readLineSync();
        Classroom? classroom = classrooms.firstWhere((c) => c.id == id,
            orElse: () => Classroom("-1", ""));
        if (classroom.id == "-1") {
          print("Lớp học không tồn tại!");
          break;
        }
        classroom.displayClasInfo();
        break;

      case "7":
        print("Thoát chương trình.");
        return;

      default:
        print("Lựa chọn không hợp lệ, vui lòng thử lại!");
    }
  }
}

class Person {
  var id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  String grade;
  List<double> score;

  Student(var id, String name, int age, String gender, this.grade, this.score)
      : super(id, name, age, gender);

  void displayInfoStudent() {
    print(
        "ID: $id, Name: $name, Age: $age, Gender: $gender, Grade: $grade, Score: $score");
  }

  double diemTB() {
    if (score.isEmpty) return 0.0;
    return score.reduce((a, b) => a + b) / score.length;
  }
}

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(
      var id, String name, int age, String gender, this.subject, this.salary)
      : super(id, name, age, gender);

  displayInfoTeacher() {
    print(
        "ID: $id, Name: $name, Age: $age, Gender: $gender, Subject: $subject, Salary: $salary");
  }
}

class Classroom {
  var id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  void addStudent(Student student) {
    students.add(student);
  }

  void ganGV(Teacher teacher) {
    this.teacher = teacher;
  }

  void displayClasInfo() {
    print("Classroom ID: $id, Name: $name");
    if (teacher != null) {
      print("Teacher: ${teacher!.name}, Subject: ${teacher!.subject}");
    } else {
      print("Chưa có giáo viên");
    }
    print("Students");
    for (var student in students) {
      student.displayInfoStudent();
    }
  }
}
