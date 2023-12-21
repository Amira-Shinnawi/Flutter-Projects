import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundModel {
  final String? sound;
  final Color color;

  const SoundModel({required this.sound, required this.color});

  void getSound() {
     final player = AudioPlayer();
    player.play(AssetSource(sound!));
  }
}
