import 'package:flutter/material.dart';

class RoundedTextCircle extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final double radius;

  const RoundedTextCircle({super.key,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    this.radius = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
