// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category(this.text, this.color, this.ontap, {super.key});
  String text;
  Color color;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 65,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
