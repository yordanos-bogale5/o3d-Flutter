import 'package:flutter/material.dart';
import 'package:shop/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      title: 'Virtual Shop',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage (),
    );
  }
}
