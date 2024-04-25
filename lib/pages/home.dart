import 'dart:async';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop/widgets/items_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Sliding Images
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },




            children: [
              Image.network(                'https://static.vecteezy.com/system/resources/previews/000/692/266/original/sale-promotion-banner-template-vector.jpg', fit: BoxFit.cover),
              Image.network(    'https://th.bing.com/th/id/OIP.OLA6sjsJrIMpDiL8CXoGnwHaDX?rs=1&pid=ImgDetMain', fit: BoxFit.cover),
              Image.network(    'https://static.vecteezy.com/system/resources/previews/004/604/785/original/online-shopping-on-website-and-mobile-application-concept-digital-marketing-shop-and-store-via-smartphone-vector.jpg', fit: BoxFit.cover),
            ],
          ),
          // Status Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.transparent,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: const Text(
                          "Shop",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const ItemsWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.shopping_cart, size: 30),
        ],
        onTap: (index) {
          // Handle navigation based on index
        },
      ),
    );
  }
}
