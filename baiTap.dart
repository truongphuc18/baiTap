// Widget Layout Deadline

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Bai5(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Bai1 extends StatelessWidget {
  const Bai1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Complete your grocery need easily",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Bai2 extends StatelessWidget {
  const Bai2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Balance",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "\$1,700.00",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buy Orange 10 Kg",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Get discount 25%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "For you",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildCategoryItem(
                    "Fruit", Icons.on_device_training, Colors.orange),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildCategoryItem("Vegetable", Icons.eco, Colors.green),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildCategoryItem(
                    "Cookies", Icons.donut_large, Colors.brown),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildCategoryItem("Meat", Icons.food_bank, Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class Bai3 extends StatelessWidget {
  const Bai3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          fruitCard('Orange', 1000, 15),
          fruitCard('Apple', 1000, 20),
          fruitCard('Banana', 1000, 5),
          fruitCard('Mango', 1000, 15),
          fruitCard('Orange', 1000, 10),
        ],
      ),
    );
  }
}

Widget fruitCard(String name, int stock, int price) {
  return Card(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.green[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 18)),
              Text(
                '$stock ready stock',
              ),
              Text('\$$price', style: TextStyle(fontSize: 16)),
            ],
          ),
          Icon(
            Icons.favorite_border,
          ),
        ],
      ),
    ),
  );
}

// bai4
class Bai4 extends StatelessWidget {
  const Bai4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Find products easier here",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // Category
            _buildCategory('Lamp'),
            SizedBox(
              height: 20,
            ),
            _buildCategory('Car'),
            SizedBox(
              height: 20,
            ),
            _buildCategory('Plant'),

            /////////////////////
          ],
        ),
      ),
    );
  }
}

Widget _buildCategory(String name) {
  return SizedBox(
    height: 200,
    width: 400,
    // color: Colors.blue,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://picsum.photos/400/200',
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    ),
  );
}

// bai 5
// class Bai5_2 extends StatelessWidget {
//   const Bai5_2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Welcome back",
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "Samantha William",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               Stack(
//                 children: [
//                   Icon(
//                     Icons.shopping_cart_outlined,
//                     size: 28,
//                   ),
//                   Positioned(
//                     right: 0,
//                     top: 0,
//                     child: Container(
//                       padding: EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Text(
//                         '2',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),

//           // search
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.search,
//                   color: Colors.grey,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'Searching item',
//                   style: TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Spacer(),
//                 Container(
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     Icons.menu,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           ////
//         ],
//       ),
//     );
//   }
// }

class Bai5 extends StatelessWidget {
  const Bai5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Samantha William",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          // search
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Searching item',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Banner
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/600/300',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.teal[400],
                    width: double.infinity,
                    height: 150,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(true),
              _buildDot(false),
              _buildDot(false),
              _buildDot(false),
            ],
          ),

          SizedBox(height: 20),

          // Cate - dong 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryIcon('Music', Icons.music_note),
              _buildCategoryIcon('Property', Icons.bar_chart),
              _buildCategoryIcon('Game', Icons.sports_esports),
              _buildCategoryIcon('Gadget', Icons.smartphone),
            ],
          ),

          SizedBox(height: 20),

          // Cate - dong 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryIcon('Electronic', Icons.tv),
              _buildCategoryIcon('Property', Icons.cut),
              _buildCategoryIcon('Game', Icons.headset),
              _buildCategoryIcon('Book', Icons.book),
            ],
          ),

          SizedBox(height: 30),

          // Best Seller
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Seller',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _buildProductItem('Plant')),
              SizedBox(width: 12),
              Expanded(child: _buildProductItem('Lamp')),
              SizedBox(width: 12),
              Expanded(child: _buildProductItem('Chair')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.orange : Colors.grey[300],
      ),
    );
  }

  Widget _buildCategoryIcon(String title, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.teal,
            size: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://picsum.photos/200/100?random=${name.hashCode}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.teal[400],
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            SizedBox(width: 4),
            Text(
              '5.0',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
