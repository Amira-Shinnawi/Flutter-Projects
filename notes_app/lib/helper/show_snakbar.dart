import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff2f2e30),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
