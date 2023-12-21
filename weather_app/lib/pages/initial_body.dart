import 'package:flutter/material.dart';

class InitialBody extends StatelessWidget {
  const InitialBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'There is no weather 😔 ,Start',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'Searching Now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ]),
    );
  }
}