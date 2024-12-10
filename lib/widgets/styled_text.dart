import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.textAlign,
  });

  final String text;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
        wordSpacing: 0.5,
      ),
    );
  }
}
