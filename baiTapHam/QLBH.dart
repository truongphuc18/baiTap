import 'dart:io';

/**
 * Bài tập quản lý sinh viên
Viết một chương trình quản lý hóa đơn bán hàng sử dụng hàm trong Dart. Chương trình cần
thực hiện các chức năng sau:
1. Thêm sản phẩm vào giỏ hàng - Bao gồm tên sản phẩm, số lượng và giá tiền.
2. Sửa và xóa sản phẩm ở giỏ hàng
3. Hiển thị giỏ hàng - Danh sách sản phẩm kèm theo thông tin chi tiết.
4. Tính tổng tiền hóa đơn - Tổng số tiền phải thanh toán.
Yêu cầu:
● Sử dụng hàm riêng cho từng chức năng.
● Dữ liệu sản phẩm được lưu trong danh sách (List) sử dụng Map.
● Hiển thị kết quả ra màn hình bằng print().
 */

void main(List<String> args) {
  List<Map<String, dynamic>> gioHang = [];

  while (true) {
    print("QUẢN LÝ BÁN HÀNG");
    print("1. Thêm sản phẩm vào giỏ hàng");
    print("2. Sửa sản phẩm ở giỏ hàng");
    print("3. Xóa sản phẩm ở giỏ hàng");
    print("4. Hiển thị giỏ hàng");
    print("5. Tính tổng tiền hóa đơn");
    print("6. Thoát");

    print("Nhập lựa chọn: ");
    int luaChon = int.parse(stdin.readLineSync().toString());

    switch (luaChon) {
      case 1:
        print("Nhập tên sản phẩm: ");
        String nameSP = stdin.readLineSync().toString();
        print("Nhập số lượng: ");
        int soLuong = int.parse(stdin.readLineSync().toString());
        print("Nhập giá tiền: ");
        double giaTien = double.parse(stdin.readLineSync().toString());

        themSP(gioHang, nameSP, soLuong, giaTien);
        break;

      case 2:
        print("Nhập tên sản phẩm cần sửa: ");
        String newNameSP = stdin.readLineSync().toString();
        print("Nhập số lượng mới: ");
        int newSoLuong = int.parse(stdin.readLineSync().toString());
        print("Nhập giá tiền mới: ");
        double newGiaTien = double.parse(stdin.readLineSync().toString());
        suaSP(gioHang, newNameSP, newSoLuong, newGiaTien);
        break;

      case 3:
        print("Nhập tên sản phẩm cần xóa: ");
        String nameSP = stdin.readLineSync().toString();
        xoaSP(gioHang, nameSP);
        break;

      case 4:
        hienThi(gioHang);
        break;

      case 5:
        double tongTienHD = tongTien(gioHang);
        print("Tổng số tiền phải thanh toán: $tongTienHD ");
        break;

      case 6:
        print("Cảm ơn và hẹn gặp lại !");
        return;

      default:
        print("Lựa chọn không hợp lệ. Vui lòng chọn lại !");
    }
  }
}

void themSP(List<Map<String, dynamic>> gioHang, String nameSP, int soLuong,
    double giaTien) {
  gioHang.add({'Tên sp': nameSP, 'Số lượng': soLuong, 'Gía tiền': giaTien});
  print("Thêm sản phẩm $nameSP vào giỏ hàng thành công !");
}

void suaSP(List<Map<String, dynamic>> gioHang, String newNameSP, int newSoLuong,
    double newGiaTien) {
  for (var item in gioHang) {
    if (item['Tên sp'] == newNameSP) {
      item['Số lượng'] = newSoLuong;
      item['Gía tiền'] = newGiaTien;
      print("Cập nhật sản phẩm thành công !");
      return;
    }
  }

  print("Không tìm thấy sản phẩm !");
}

void xoaSP(List<Map<String, dynamic>> gioHang, String nameSP) {
  gioHang.removeWhere((item) => item['Tên sp'] == nameSP);
  print("Sản phẩm $nameSP đã được xóa !");
}

void hienThi(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print("Giỏ hàng trống !");
    return;
  }
  print("Danh sách sản phẩm trong giỏ hàng !");
  for (var item in gioHang) {
    print(
        "${item['Tên sp']} | Số lượng: ${item['Số lượng']} | Gía: ${item['Gía tiền']}");
  }
}

double tongTien(List<Map<String, dynamic>> gioHang) {
  double tongTien = 0;
  for (var item in gioHang) {
    tongTien += item['Số lượng'] * item['Gía tiền'];
  }
  return tongTien;
}
