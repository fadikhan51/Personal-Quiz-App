import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(this.data, {super.key, this.fontSize, this.color});

  String data;
  double? fontSize;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
