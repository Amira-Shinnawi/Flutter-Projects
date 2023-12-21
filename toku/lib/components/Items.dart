import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../models/item_model.dart';

// ignore: camel_case_types
class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.number, required this.color})
      : super(key: key);

  final Item number;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(
        children: [
          Container(
            color: const Color(0xffFEF6DB),
            child: Image.asset(
              number.image!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Text(
                  number.jpName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  number.enName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: const Icon(
              Icons.play_arrow,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              try {
                AudioPlayer player = AudioPlayer();
                player.play(AssetSource(number.sound));
              } catch (ex) {
                print(ex);
              }
            },
          ),
        ],
      ),
    );
  }
}

class PhraseItem extends StatelessWidget {
  const PhraseItem({Key? key, required this.number, required this.color})
      : super(key: key);

  final Item number;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(
        children: [
          Container(
            color: const Color(0xffFEF6DB),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Text(
                  number.jpName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  number.enName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: const Icon(
              Icons.play_arrow,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              try {
                AudioPlayer player = AudioPlayer();
                player.play(AssetSource(number.sound));
              } catch (ex) {
                print(ex);
              }
            },
          ),
        ],
      ),
    );
  }
}