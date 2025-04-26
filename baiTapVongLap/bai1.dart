import 'dart:io';

/**
 * Bài tập quản lý sinh viên
Đề bài:
Viết chương trình quản lý danh sách sinh viên gồm các chức năng sau:
1. Thêm sinh viên vào danh sách. Mỗi sinh viên có:
○ Họ tên.
○ Điểm toán.
○ Điểm lý.
○ Điểm hóa.
2. Hiển thị danh sách sinh viên kèm theo:
○ Điểm trung bình (ĐTB).
○ Xếp loại học lực dựa trên ĐTB:
Dưới 5: Kém, 5 - 7: Khá, 7 - 9: Giỏi, lớn hơn 9: Xuất sắc
1. Tìm sinh viên có ĐTB cao nhất trong danh sách.
2. Thoát chương trình.
 */

void main(List<String> args) {
  List<Map<String, dynamic>> danhSachSV = [];

  
  while (true) {
    print("Quản Lý Sinh Viên !");
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách sinh viên");
    print("3. Tìm sinh viên có DTB cao nhất");
    print("4. Thoát chương trình");

    stdout.write("Nhập lựa chọn : ");
    var luaChon = int.parse(stdin.readLineSync().toString());

    if (luaChon == 1) {
      stdout.write("Nhập họ tên sv: ");
      String hoTen = stdin.readLineSync()!;

      stdout.write("Nhập điểm toán: ");
      double diemToan = double.parse(stdin.readLineSync()!);

      stdout.write("Nhập điểm lý: ");
      double diemLy = double.parse(stdin.readLineSync()!);

      stdout.write(("Nhập điểm hóa: "));
      double diemHoa = double.parse(stdin.readLineSync()!);

      double diemTB = (diemToan + diemLy + diemHoa) / 3;

      String xepLoai;
      if (diemTB < 5) {
        xepLoai = "Kém";
      } else if (diemTB <= 7) {
        xepLoai = "Khá";
      } else if (diemTB <= 9) {
        xepLoai = "Giỏi";
      } else {
        xepLoai = "Xuất sắc";
      }

      if (hoTen == null ||
          diemToan == null ||
          diemLy == null ||
          diemHoa == null) {
        print("Vui lòng nhập đầy đủ thông tin !");
      } else {
        danhSachSV.add({
          'Họ Tên': hoTen,
          'Điểm Toán': diemToan,
          'Điểm Lý': diemLy,
          'Điểm Hóa': diemHoa,
          'Điểm TB': diemTB,
          'Học Lực': xepLoai
        });
      }
      print("Thêm sinh viên thành công !");
    } else if (luaChon == 2) {
      if (danhSachSV.isEmpty) {
        print("Danh sách sinh viên trống !");
      } else {
        print("DANH SÁCH SINH VIÊN !");
        for (var sv in danhSachSV) {
          print(sv);
        }
      }
    } else if (luaChon == 3) {
      if (danhSachSV.isEmpty) {
        print("Danh sách sinh viên trống !");
      } else {
        double dtbTop = danhSachSV[0]['Điểm TB'];
        List<Map<String, dynamic>> svTop = [danhSachSV[0]];

        for (var sv in danhSachSV) {
          if (sv['Điểm TB'] > dtbTop) {
            dtbTop = sv['Điểm TB'];
            svTop = [sv];
          } else if (sv['Điểm TB'] == dtbTop) {
            svTop.add(sv);
          }
        }

        // xóa trùng
        svTop = svTop.toSet().toList();

        print("Sinh viên có DTB cao nhất ");
        for (var sv in svTop) {
          print("${sv['Họ Tên']} - DTB: ${sv['Điểm TB']}");
        }
      }
    } else if (luaChon == 4) {
      print("Cảm ơn và hẹn gặp lại !");
      break;
    }
  }
}
