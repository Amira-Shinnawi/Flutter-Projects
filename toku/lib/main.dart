import 'package:flutter/material.dart';
import 'package:toku/screens/home_page.dart';

void main() {
  runApp(const Toku_App());
}

// ignore: camel_case_types
class Toku_App extends StatelessWidget {
    const Toku_App({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home_Page(),
    );
  }
}