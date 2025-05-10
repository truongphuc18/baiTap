import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaiTapSateful(),
    );
  }
}

class BaiTapSateful extends StatefulWidget {
  const BaiTapSateful({super.key});

  @override
  State<BaiTapSateful> createState() => _BaiTapSatefulState();
}

class _BaiTapSatefulState extends State<BaiTapSateful> {
  List<Map<String, dynamic>> shoeList = [
    {
      'name': 'Nike Air Max',
      'price': 120.0,
      // 'imgURL': 'https://via.placeholder.com/50?text=Nike+Air+Max',
      'imageUrl':
          'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/e783e052-9360-4afb-adb8-c4e9c0f5db07/NIKE+AIR+MAX+NUAXIS.png',
    },
    {
      'name': 'Adidas Ultraboost',
      'price': 150.0,
      'imageUrl':
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/235f6bebfc6c4541811d18a387ac3be4_9366/Giay_Ultraboost_1.0_DJen_HQ4206_HM1.jpg',
    },
    {
      'name': 'Puma RS-X',
      'price': 100.0,
      'imageUrl':
          'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/369449/31/sv01/fnd/VNM/fmt/png/Gi%C3%A0y-th%E1%BB%83-thao-RS-X-Toys'
    },
    {
      'name': 'Nike Air Max 2',
      'price': 120.0,
      'imageUrl':
          'https://cdn-images.farfetch-contents.com/15/08/80/03/15088003_40788212_1000.jpg'
    },
    {
      'name': 'Nike Air Max 4',
      'price': 120.0,
      'imageUrl':
          'https://myshoes.vn/image/catalog/2023/nike/nike03/giay-nike-air-max-impact-4-nam-navy-den-04.jpg'
    }
  ];

  List<Map<String, dynamic>> cartItem = [];

  // them vao gio hang
  void addToCart(Map<String, dynamic> shoe) {
    setState(() {
      // kiem tra xem sp da co trong gio hang chua
      bool found = false;
      for (int i = 0; i < cartItem.length; i++) {
        if (cartItem[i]['name'] == shoe['name']) {
          // neu co thi tang so luong
          cartItem[i]['soLuong'] = cartItem[i]['soLuong'] + 1;
          found = true;
          break;
        }
      }

      // neu chua co thi them vao gio hang
      if (!found) {
        Map<String, dynamic> newItem = {
          'name': shoe['name'],
          'price': shoe['price'],
          'imageUrl': shoe['imageUrl'],
          'soLuong': 1,
        };
        cartItem.add(newItem);
      }
    });
  }

  // xoa
  void removeFromCart(int index) {
    setState(() {
      cartItem.removeAt(index);
    });
  }

  // tong tien
  double tongTien() {
    double tongTien = 0;
    for (var item in cartItem) {
      tongTien += item['price'] * item['soLuong'];
    }

    return tongTien;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shoe Store",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          phanGioHang(),
          phanDanhSachGiay(),
        ],
      ),
    );
  }

// gio hang
  Widget phanGioHang() {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gio hang",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          cartItem.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Text("Gio hang trong"),
                  ),
                )
              : Container(
                  constraints: BoxConstraints(maxHeight: 300),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItem.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            // hinh anh sp
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.network(
                                cartItem[index]['imageUrl'] ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.image);
                                },
                              ),
                            ),
                            SizedBox(width: 12),
                            // thong tin sp
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem[index]['name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Gia: ${cartItem[index]['price']} \$",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            // so luong
                            Text(
                              "So luong: ${cartItem[index]['soLuong']}",
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(width: 8),
                            // nut xoa
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              ),
                              onPressed: () => removeFromCart(index),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
          // hien thi tong tien
          if (cartItem.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tong tien: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${tongTien().toStringAsFixed(2)} \$",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

// danh sach giay
  Widget phanDanhSachGiay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Danh sach giay",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: shoeList.length,
            itemBuilder: (context, index) {
              return hienThiSP(shoeList[index]);
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget hienThiSP(Map<String, dynamic> shoe) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        // elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // hinh anh sp
              Expanded(
                child: Center(
                  child: Image.network(
                    shoe['imageUrl'] ?? '',
                    // fit: BoxFit.fitHeight,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.image,
                        size: 60,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 8),
              // ten sp
              Text(
                shoe['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              // gia
              Text(
                '${shoe['price']} \$',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 8),
              // nut them vao gio hang
              ElevatedButton(
                onPressed: () => addToCart(shoe),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 36),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Them vao gio hang',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

