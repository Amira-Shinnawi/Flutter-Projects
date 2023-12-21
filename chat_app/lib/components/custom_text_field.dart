import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({super.key, required this.onChanged, this.hintText ,this.pass=false,this.suffixIcon});
  Function(String) onChanged;
  String? hintText;
  bool? pass;
  Widget? suffixIcon;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:pass! ,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      style:const TextStyle(color: Colors.white),
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: '$hintText',
        suffixIcon:suffixIcon ,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
