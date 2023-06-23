import 'package:flutter/material.dart';

class BackIandCardI extends StatelessWidget {
  const BackIandCardI({
    super.key,
    required this.icon,
    this.iconColor = Colors.black87,
    this.bgColor = Colors.white70,
    this.size = 40,
  });

  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size / 2,
      ),
    );
  }
}
