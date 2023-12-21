import 'package:flutter/material.dart';
import '../components/Items.dart';
import '../models/item_model.dart';

class Colors_Page extends StatelessWidget {
  const Colors_Page({super.key});

  final List<Item> colorpage = const [
    Item(
        image: 'assets/images/colors/color_black.png',
        jpName: 'Burakku',
        enName: 'Black',
        sound: 'sounds/colors/black.wav'),
    Item(
        image: 'assets/images/colors/color_brown.png',
        jpName: 'Chairo',
        enName: 'Brown',
        sound: 'sounds/colors/brown.wav'),
    Item(
        image: 'assets/images/colors/color_dusty_yellow.png',
        jpName: 'Hokori ppoi kiiro',
        enName: 'Dusty Yellow',
        sound: 'sounds/colors/dusty_yellow.wav'),
    Item(
        image: 'assets/images/colors/color_gray.png',
        jpName: 'Gurē',
        enName: 'Gray', 
        sound: 'sounds/colors/gray.wav'),
    Item(
        image: 'assets/images/colors/color_green.png',
        jpName: 'Midori',
        enName: 'Green',
        sound: 'sounds/colors/green.wav'),
    Item(
        image: 'assets/images/colors/color_red.png',
        jpName: 'Aka',
        enName: 'Red',
        sound: 'sounds/colors/red.wav'),
    Item(
        image: 'assets/images/colors/color_white.png',
        jpName: 'Shiro',
        enName: 'White',
        sound: 'sounds/colors/white.wav'),
    Item(
        image: 'assets/images/colors/yellow.png',
        jpName: 'Kiiro',
        enName: 'Yellow',
        sound: 'sounds/colors/yellow.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
        backgroundColor: const Color(0xff46322B),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: colorpage.length,
        itemBuilder: (context, index) {
          return ListItem(
              number: colorpage[index], 
              color: const Color(0xff79359F));
        },
      ),
    );
  }
}