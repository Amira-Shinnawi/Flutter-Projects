import 'package:flutter/material.dart';

import '../components/Items.dart';
import '../models/item_model.dart';

class Family_Members extends StatelessWidget {
  const Family_Members({Key? key}) : super(key: key);
  final List<Item> familymembers = const [
    Item(
        image: 'assets/images/family_members/family_father.png',
        jpName: 'Chichuioya',
        enName: 'Father',
        sound: 'sounds/family_members/father.wav'),
    Item(
        image: 'assets/images/family_members/family_mother.png',
        jpName: 'Hahaoya',
        enName: 'Mother',
        sound: 'sounds/family_members/mother.wav'),
    Item(
        image: 'assets/images/family_members/family_grandfather.png',
        jpName: 'Ojisan',
        enName: 'Grandfather',
        sound: 'sounds/family_members/grand_father.wav'),
    Item(
        image: 'assets/images/family_members/family_grandmother.png',
        jpName: 'Sobo',
        enName: 'Grandmother',
        sound: 'sounds/family_members/grand_mother.wav'),
    Item(
        image: 'assets/images/family_members/family_daughter.png',
        jpName: 'Musume',
        enName: 'Daughter',
        sound: 'sounds/family_members/daughter.wav'),
    Item(
        image: 'assets/images/family_members/family_son.png',
        jpName: 'Musuko',
        enName: 'Son',
        sound: 'sounds/family_members/son.wav'),
    Item(
        image: 'assets/images/family_members/family_older_brother.png',
        jpName: 'Nisan',
        enName: 'Older Brother',
        sound: 'sounds/family_members/older_bother.wav'),
    Item(
        image: 'assets/images/family_members/family_older_sister.png',
        jpName: 'Ane',
        enName: 'Older Mother',
        sound: 'sounds/family_members/older_sister.wav'),
    Item(
        image: 'assets/images/family_members/family_younger_brother.png',
        jpName: 'otōto',
        enName: 'Younger Brother',
        sound: 'sounds/family_members/younger_brohter.wav'),
    Item(
        image: 'assets/images/family_members/family_younger_sister.png',
        jpName: 'Imōto',
        enName: 'Younger Sister',
        sound: 'sounds/family_members/younger_sister.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Members'),
        backgroundColor: const Color(0xff46322B),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: familymembers.length,
        itemBuilder: (context, index) {
          return ListItem(
              number: familymembers[index], 
              color: const Color(0xff558B37));
        },
      ),
    );
  }
}
