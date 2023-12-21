import 'package:flutter/material.dart';
import 'package:tunes_player_app/pages/tunes_sound.dart';

void main() {
  runApp(const TunesApp());
}

class TunesApp extends StatelessWidget {
  const TunesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TunesSound(),
    );
  }
}