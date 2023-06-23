import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    this.color,
    required this.text,
    this.size = 0,
    this.height,
  });

  final Color? color;
  final String text;
  final double size;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
          color: color,
          fontSize: size == 0 ? Dimension.font12 : size,
          height: height,
        ));
  }
}
