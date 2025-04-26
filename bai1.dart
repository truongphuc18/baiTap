import 'dart:io';

/**
 *  Đề bài:
Viết chương trình nhập vào thông tin của một nhân viên:
● Họ tên.
● Số giờ làm việc.
● Lương mỗi giờ.
Chương trình sẽ:
1. Tính tổng lương = số giờ làm × lương mỗi giờ.
2. Thêm phụ cấp:
○ Nếu làm hơn 40 giờ, nhân viên nhận thêm 20% tổng lương.
3. Trừ thuế thu nhập:
○ Lương trên 10 triệu: trừ 10%.
○ Lương từ 7 đến 10 triệu: trừ 5%.
○ Lương dưới 7 triệu: không trừ.
4. In kết quả:
○ Họ tên, tổng lương trước thuế, thuế thu nhập, và lương thực lãnh.
 */

void main(List<String> args) {
  print("Nhập thông tin nhân viên: ");
  print("Nhập họ tên: ");
  var hoTen = stdin.readLineSync();
  print("Nhập số giờ làm việc: ");
  var soGioLam = int.parse(stdin.readLineSync()!);
  print("Nhập lương mỗi giờ: ");
  var luongMoiGio = int.parse(stdin.readLineSync()!);
  var tongLuong = soGioLam * luongMoiGio;
  var phuCap = 0;
  if (soGioLam > 40) {
    phuCap = (tongLuong * 0.2).toInt();
  }
  var tongLuongSauPhuCap = tongLuong + phuCap;

  var thueThuNhap = 0;
  if(tongLuongSauPhuCap > 10000000) {
    thueThuNhap = (tongLuongSauPhuCap * 0.1).toInt();
  } else if(tongLuongSauPhuCap >= 7000000) {
    thueThuNhap = (tongLuongSauPhuCap * 0.05).toInt();
  }

  var luongThucLanh = tongLuongSauPhuCap - thueThuNhap;
  print("Họ tên: $hoTen");
  print("Tổng lương trước thuế: $tongLuong");
  print("Thuế thu nhập: $thueThuNhap");
  print("Lương thực lãnh: $luongThucLanh");

  
}