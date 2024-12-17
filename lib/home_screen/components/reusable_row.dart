import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  const ReusableRow({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
    this.textStyle,
    this.iconSize,
    this.onIconTap,
    this.spacing=1.0,
  });

  final String title;
  final IconData icon;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? iconSize;
  final VoidCallback? onIconTap;
  final double spacing;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onIconTap,
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,

          ),
        ),
        SizedBox(
          width: spacing,
        ),
        Text(title, style: textStyle ?? const TextStyle(color: Colors.black))
      ],
    );
  }
}
