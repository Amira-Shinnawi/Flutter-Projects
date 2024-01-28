import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onPressed,});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
        enabledBorder: builtOutlineInputBorder(),
        focusedBorder: builtOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder builtOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
