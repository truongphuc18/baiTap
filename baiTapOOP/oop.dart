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

void main(List<String> args) {
  Teacher teacher1 = Teacher(1, "Mr.Sang", 40, "Male", "Flutter", 20000000);
  Student student1 =
      Student(101, "Truong Phuc", 21, "Male", "01", [8.5, 9.0, 9.5]);
  Student student2 =
      Student(101, "Truong Phuc 2", 21, "Male", "01", [7.8, 9.0, 9.5]);

  Classroom class01 = Classroom(1, "01");
  class01.ganGV(teacher1);
  class01.addStudent(student1);
  class01.addStudent(student2);

  class01.displayClasInfo();
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
