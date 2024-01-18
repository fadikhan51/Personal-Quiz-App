import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.data, {super.key, this.fontSize, this.color});

  String data;
  double? fontSize;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
