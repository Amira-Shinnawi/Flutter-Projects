import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap,required this.buttonName});
  VoidCallback? onTap;
  String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        width: double.infinity,
        height: 50,
        child: Center(child: Text(buttonName,style: const TextStyle(color: Colors.white),)),
      ),
    );
  }
}