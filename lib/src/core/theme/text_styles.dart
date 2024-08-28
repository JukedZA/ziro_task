import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';

class Weights {
  static const FontWeight reg = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? alignment;
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.weight,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: GoogleFonts.inter(
        color: color ?? ThemeColors.primaryText,
        fontWeight: weight ?? Weights.reg,
        fontSize: size,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? alignment;
  const HeadingText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: GoogleFonts.montserrat(
        color: color ?? ThemeColors.primaryText,
        fontWeight: weight ?? Weights.bold,
        fontSize: size ?? 20,
      ),
    );
  }
}
