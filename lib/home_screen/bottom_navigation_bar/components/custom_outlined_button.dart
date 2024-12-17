import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.isSelected,
    this.fillColor, // Optional parameter for fill color
    this.textColor, // Optional parameter for text color
    this.borderSideColor, // Optional parameter for border side color
  });

  final String title;
  final VoidCallback onPress;
  final bool isSelected;
  final Color? fillColor; // Optional field for fill color
  final Color? textColor; // Optional field for text color
  final Color? borderSideColor; // Optional field for border side color

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(110, 40)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: borderSideColor ?? (isSelected ? Colors.green : const Color(0xffE6E6F2)),
            width: 2.0,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          fillColor ?? (isSelected ? const Color(0xffEAF8F1) : Colors.white),
        ),
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: textColor ?? (isSelected ? Colors.green : Colors.black),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}