import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    this.color = AppColors.mainColor,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
  });

  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        maxLines: 1,
        style: GoogleFonts.roboto(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size == 0 ? Dimension.font20 : size,
        ));
  }
}
