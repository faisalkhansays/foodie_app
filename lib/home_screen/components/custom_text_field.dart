import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.borderRadius,
     this.prefixIcon,
    this.onTap, this.borderSide, this.suffixIcon,
    this.fillColor = const Color(0xffF5F7F9),
  });

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final BorderSide? borderSide;
  final VoidCallback? onTap;
  final Color fillColor;


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        border:  OutlineInputBorder(

            borderRadius: BorderRadius.circular(borderRadius),
          borderSide:borderSide??const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}