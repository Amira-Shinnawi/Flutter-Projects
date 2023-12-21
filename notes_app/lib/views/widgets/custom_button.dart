import 'package:flutter/material.dart';

import '../../constaint.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({super.key, required this.buttonName, this.onTap,  this.isLoading=false});
  final String buttonName;
 final void Function()? onTap;
 final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
            child:isLoading?const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ):Text(
          buttonName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
