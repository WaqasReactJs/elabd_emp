import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final TextInputType? type;
  final int? lengthh;
  final Widget? suffixIcon;
  final Widget? prefixIcon; // New parameter for prefix icon

  const CustomTextField({
    Key? key,
    required this.hinttext,
    required this.controller,
    this.type,
    this.lengthh,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6 * width),
      child: TextField(
        controller: controller,
        keyboardType: type,
        maxLength: lengthh,
        style: const TextStyle(
          color: Colors.grey,
        ),
        cursorHeight: 20,
        cursorColor: white,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          fillColor: white,
          filled: true,
        ),
      ),
    );
  }
}
