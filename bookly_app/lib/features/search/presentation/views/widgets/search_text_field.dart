import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onPressed, this.onSubmitted, this.onChanged});
  final void Function()? onPressed;
 final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted:onSubmitted ,
      onChanged: onChanged,
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
