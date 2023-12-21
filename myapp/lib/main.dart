import 'package:flutter/material.dart';

void main() {
  runApp(const Birthday_Card());
}
// ignore: camel_case_types
class Birthday_Card extends StatelessWidget {
   const Birthday_Card({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFD2BCD5),
        body: Center(
          child: Image(
            image: AssetImage('assets/images/birthday_card.png'),
            ),
        ),
      ),        
    );
  }
}