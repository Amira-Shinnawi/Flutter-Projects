import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, this.onChanged, this.hintText, this.pass = false,this.inputType});
  Function(String)? onChanged;
  String? hintText;
  TextInputType? inputType;
  bool? pass;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: pass!,
      style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: '$hintText',
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
