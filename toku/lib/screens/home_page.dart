import 'package:flutter/material.dart';
import 'package:toku/components/Category.dart';
import 'package:toku/screens/family.dart';
import 'package:toku/screens/numbers.dart';
import 'package:toku/screens/phrases.dart';

import 'colors.dart';

// ignore: camel_case_types
class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF6DB),
      appBar: AppBar(
        backgroundColor: const Color(0xff46322B),
        title: const Text('Toku'),
      ),
      body: Column(children: [
        Category('Numbers', const Color(0xffEF9235),
         () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const Numbers()));
          }),
        Category('Family Members', const Color(0xff558B37),() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const Family_Members()));
          }),
        Category('Colors', const Color(0xff79359F),() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const Colors_Page()));
          }),
        Category('Phrases', const Color(0xff50ADC7),() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const Phrases()));
          }),
      ]),
    );
  }
}
