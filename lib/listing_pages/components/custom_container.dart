import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final bool isActive;
  final double? width;

  const CustomContainer({super.key, required this.isActive, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 115,
      height: 10,
      decoration: BoxDecoration(
          color: isActive ? const Color(0xff2BB673) : const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}