import 'package:flutter/material.dart';



class MyShopPage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Item 1', imageUrl: 'https://th.bing.com/th/id/R.b052a54c3e9a0ad39d978d97352d7395?rik=EO%2fm%2fBWuo%2bhC6A&pid=ImgRaw&r=0'),
    Item(name: 'Item 2', imageUrl: 'https://th.bing.com/th/id/R.133fca7e06ef86a208148a59d31826be?rik=XM0Qjbp9XGqPiw&riu=http%3a%2f%2fecx.images-amazon.com%2fimages%2fI%2f71vopzdh-lL.jpg&ehk=jzd6YwwNvHyQaZiTnE9Y0JLQvKD49N4Ei3NOZCUxFp0%3d&risl=&pid=ImgRaw&r=0'),
    Item(name: 'Item 3', imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/61QXVSF6bLL._AC_SL1500_.jpg'),
    Item(name: 'Item 4', imageUrl: 'https://th.bing.com/th/id/OIP.0ygH3dSZfDVlmjM0w01LUgHaF-?rs=1&pid=ImgDetMain'),
    Item(name: 'Item 5', imageUrl: 'https://th.bing.com/th/id/OIP.8ZkINuqqUXtmt2VjT31ciAHaE7?rs=1&pid=ImgDetMain'),
    Item(name: 'Item 6', imageUrl: 'https://th.bing.com/th/id/R.bb489a6e65a2260deb24e177c73f9b4c?rik=BVZRbE%2bJmCrRHQ&pid=ImgRaw&r=0'),
    Item(name: 'Item 7', imageUrl: 'https://th.bing.com/th/id/OIP.S7ZRKpkX9pUJl5rQE29znAHaHa?rs=1&pid=ImgDetMain'),
    Item(name: 'Item 8', imageUrl: 'https://th.bing.com/th/id/R.8169b239ea5086726c8732c233fae22f?rik=07dRnt5txXRCzA&pid=ImgRaw&r=0'),
    Item(name: 'Item 9', imageUrl: 'https://th.bing.com/th/id/R.69012a5fe766ea578231a37646d6e371?rik=FM9qZ1NP0QJFfg&pid=ImgRaw&r=0'),
    Item(name: 'Item 10', imageUrl: 'https://th.bing.com/th/id/OIP.EqAI5CmJ-pHOUTWOxFYhNAHaHa?rs=1&pid=ImgDetMain'),
  ];

  MyShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('asset/6352842_sd.jpg'), // Provide your shop wall image
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 50,
            left: 20,
            child: Rack(items: items),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Rack(items: items),
          ),
          Positioned(
            top: 250,
            left: 20,
            child: Rack(items: items),
          ),
          Positioned(
            top: 250,
            right: 20,
            child: Rack(items: items),
          ),
        ],
      ),
    );
  }
}

class Rack extends StatelessWidget {
  final List<Item> items;

  Rack({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  items[index].imageUrl,
                  height: 145,
                  width: double.infinity, // Use double.infinity to fit the width of the container
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5),
                Text(items[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String name;
  final String imageUrl;

  Item({required this.name, required this.imageUrl});
}
