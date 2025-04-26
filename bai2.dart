import 'dart:io';

/**
 * Đề bài:
Viết chương trình nhập vào thông tin của một hóa đơn bán hàng:
● Tên sản phẩm.
● Số lượng mua.
● Đơn giá.
Chương trình sẽ:
1. Tính thành tiền = số lượng × đơn giá.
2. Áp dụng giảm giá:
○ Nếu thành tiền >= 1,000,000, giảm giá 10%.
○ Nếu thành tiền từ 500,000 đến dưới 1,000,000, giảm giá 5%.
○ Nếu dưới 500,000, không giảm giá.
3. Tính thuế VAT 8% trên tổng số tiền sau giảm giá.
4. In hóa đơn bao gồm:
○ Tên sản phẩm, số lượng, đơn giá.
○ Thành tiền, giảm giá, thuế VAT, và tổng thanh toán cuối cùng
 */

void main(List<String> args) {
  print("Nhập thông tin hóa đơn !");
  print("Nhập tên sản phẩm: ");
  var tenSP = stdin.readLineSync();
  print("Nhập số lượng mua: ");
  var soLuong = int.parse(stdin.readLineSync()!);
  print("Nhập đơn giá: ");
  var donGia = double.parse(stdin.readLineSync()!);

  var thanhTien = soLuong * donGia;
  var discount = 0;
  if (thanhTien >= 1000000) {
    discount = (thanhTien * 0.1).toInt();
  } else if (thanhTien >= 500000) {
    discount = (thanhTien * 0.05).toInt();
  }
  var thanhTienSauGiamGia = thanhTien - discount;
  var thueVAT = (thanhTienSauGiamGia * 0.08).toInt();
  var tongThanhToan = thanhTienSauGiamGia + thueVAT;

  print("Tên sản phẩm: $tenSP");
  print("Số lượng: $soLuong");
  print("Đơn giá: $donGia");
  print("Thành tiền: $thanhTien");
  print("Giảm giá: $discount");
  print("Thuế VAT: $thueVAT");
  print("Tổng thanh toán: $tongThanhToan");
  
}
