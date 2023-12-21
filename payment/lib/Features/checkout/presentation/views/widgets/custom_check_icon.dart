import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0xFF34A853),
      radius: 40,
      child: Icon(
        Icons.check,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
