import 'package:flutter/material.dart';
import 'package:tunes_player_app/widgets/tune_item.dart';

import '../model/sound_model.dart';

class TunesSound extends StatelessWidget {
const  TunesSound({super.key});

  final List<SoundModel> tunes = const [
    SoundModel(sound: 'note1.wav', color: Color(0xffF44336)),
    SoundModel(sound: 'note2.wav', color: Color(0xffF89800)),
    SoundModel(sound: 'note3.wav', color: Color(0xffFEEB3B)),
    SoundModel(sound: 'note4.wav', color: Color(0xff4CAF50)),
    SoundModel(sound: 'note5.wav', color: Color(0xff2F9688)),
    SoundModel(sound: 'note6.wav', color: Color(0xff2896F3)),
    SoundModel(sound: 'note7.wav', color: Color(0xff9C27B0)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const Color(0xff253238),
        title:const Text('Flutter Tune'),
        centerTitle: true,
      ),
      body: Column(children:
        tunes
        .map(
              (e) => TuneItem(tune: e),
            )
            .toList(),
      ),
    );
  }
}
