import 'package:flutter/material.dart';
import 'package:tunes_player_app/model/sound_model.dart';

class TuneItem extends StatelessWidget {
const  TuneItem({super.key, required this.tune});
  final SoundModel tune;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          tune.getSound();
        },
        child: Container(
          color: tune.color,
        ),
      ),
    );
  }
}
