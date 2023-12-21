import 'package:flutter/material.dart';
import 'package:toku/models/item_model.dart';


import '../components/Items.dart';


class Phrases extends StatelessWidget {
  const Phrases({super.key});

  final List<Item> phrases = const [
    Item(
        jpName: 'Kimasu ka',
        enName: 'Are you coming',
        sound: 'sounds/phrases/are_you_coming.wav'),
    Item(
        jpName: 'Kōdoku suru koto o wasurenaide kudasai',
        enName: 'Dont forget to Subscribe',
        sound: 'sounds/phrases/dont_forget_to_subscribe.wav'),
    Item(
        jpName: 'Go kibun wa ikagadesu ka',
        enName: 'How are you feeling',
        sound: 'sounds/phrases/how_are_you_feeling.wav'),
    Item(
        jpName: 'Watashi wa anime ga daisukidesu',
        enName: 'I Love Anime', 
        sound: 'sounds/phrases/i_love_anime.wav'),
    Item(
        jpName: 'Watashi wa puroguramingu daisukidesu',
        enName: 'I Love Programming',
        sound: 'sounds/phrases/i_love_programming.wav'),
    Item(
        jpName: 'Puroguramingu wa kantandesu ',
        enName: 'Programming is easy',
        sound: 'sounds/phrases/programming_is_easy.wav'),
    Item(
        jpName: 'Namae wa nandesu ka ?',
        enName: 'What is your name ?',
        sound: 'sounds/phrases/what_is_your_name.wav'),
    Item(
        jpName: 'Doko ni iku no',
        enName: 'Where are you Going',
        sound: 'sounds/phrases/where_are_you_going.wav'),
    Item(
        jpName: 'Hai watashi wa kite imasu',
        enName: 'Yes i am Coming',
        sound: 'sounds/phrases/yes_im_coming.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phrases'),
        backgroundColor: const Color(0xff46322B),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return PhraseItem(
              number: phrases[index], 
              color: const Color(0xff50ADC7));
        },
      ),
    );
  }
}