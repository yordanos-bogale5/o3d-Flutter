import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key});

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _imageUrls = [
    'https://static.vecteezy.com/system/resources/previews/000/692/266/original/sale-promotion-banner-template-vector.jpg',
    'https://th.bing.com/th/id/OIP.OLA6sjsJrIMpDiL8CXoGnwHaDX?rs=1&pid=ImgDetMain',
    'https://static.vecteezy.com/system/resources/previews/004/604/785/original/online-shopping-on-website-and-mobile-application-concept-digital-marketing-shop-and-store-via-smartphone-vector.jpg'
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200, // Adjust height as needed
              child: CachedNetworkImage(
                imageUrl: _imageUrls[0],
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 150,
                    child: CachedNetworkImage(
                      imageUrl: _imageUrls[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
