import 'dart:io';

/**
 * Bài Tập Lớn: Quản Lý Sản Phẩm
Đề bài:
Viết chương trình quản lý sản phẩm trong cửa hàng gồm các chức năng sau:
1. Thêm sản phẩm vào danh sách.
○ Mỗi sản phẩm có:
■ Tên sản phẩm.
■ Giá tiền.
■ Số lượng trong kho.
2. Hiển thị danh sách sản phẩm với thông tin chi tiết.
3. Tìm kiếm sản phẩm theo tên.
4. Bán sản phẩm:
○ Nhập tên sản phẩm và số lượng cần bán.
○ Giảm số lượng tồn kho nếu có đủ hàng.
○ Báo lỗi nếu số lượng hàng không đủ.
5. Thoát chương trình.
 */

void main(List<String> args) {
  List<Map<String, dynamic>> danhSachSP = [];

  while (true) {
    print("Quản lý sản phẩm !");
    print("1. Thêm sản phẩm");
    print("2. Hiển thị danh sách sản phẩm với thông tin chi tiết");
    print("3. Tìm kiếm sản phẩm theo tên");
    print("4. Bán sản phẩm");
    print("5. Thoát chương trình");

    stdout.write("Nhập lựa chọn : ");
    var luaChon = int.parse(stdin.readLineSync().toString());

    if (luaChon == 1) {
      print("Nhập tên sp: ");
      String tenSP = stdin.readLineSync().toString();

      print("Nhập giá tiền: ");
      double giaTien = double.parse(stdin.readLineSync().toString());

      print("Nhập số lượng trong kho: ");
      int soLuongTrongKho = int.parse(stdin.readLineSync().toString());

      if (tenSP == null || giaTien == null || soLuongTrongKho == null) {
        stdout.write("Vui lòng nhập đầy đủ thông tin !");
      } else {
        danhSachSP.add({
          'Tên': tenSP,
          'giá': giaTien,
          'Số lượng trong kho': soLuongTrongKho
        });
      }

      print("Thêm sản phẩm thành công !");
    } else if (luaChon == 2) {
      if (danhSachSP.isEmpty) {
        print("Danh sách trống !");
      } else {
        print("Danh sách sản phẩm !");
        for (var sp in danhSachSP) {
          print(sp);
        }
      }
    } else if (luaChon == 3) {
      if (danhSachSP.isEmpty) {
        print("Danh sách trống !");
      } else {
        print("Nhập tên sản phẩm cần tìm :");
        String findSP = stdin.readLineSync().toString();
        bool kqFind = false;
        for (var sp in danhSachSP) {
          if (sp["Tên"] == findSP) {
            print(
                "Tìm thấy : ${sp['Tên']} - giá: ${sp['giá']} - Số lượng trong kho: ${sp['Số lượng trong kho']}");
            kqFind = true;
          }
        }
        if (!kqFind) {
          print("Không tìm thấy sp");
        }
      }
    } else if (luaChon == 4) {
      print("Nhập tên sp cần bán: ");
      String tenSp = stdin.readLineSync().toString();
      print("Nhập số lượng cần bán: ");
      int soLuongBan = int.parse(stdin.readLineSync().toString());

      bool daBan = false;

      for (var sp in danhSachSP) {
        if (sp["Tên"] == tenSp) {
          if (soLuongBan != null &&
              soLuongBan > 0 &&
              sp["Số lượng trong kho"] >= soLuongBan) {
            sp["Số lượng trong kho"] -= soLuongBan;
            print(
                "Đã bán thành công sản phẩm: ${sp["Tên"]}, số lượng: $soLuongBan");
            print("Số lượng còn lại trong kho: ${sp["Số lượng trong kho"]}");
            daBan = true;
          } else {
            print("Không đủ số lượng trong kho !");
          }
        }
      }
      if (!daBan) {
        print("Không tìm thấy sản phẩm cần bán");
      }
    } else if (luaChon == 5) {
      print("Cảm ơn và hẹn gặp lại !");
      break;
    } else {
      print("Lựa chọn không hợp lệ !");
    }
  }
}
