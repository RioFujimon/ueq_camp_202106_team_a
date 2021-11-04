import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicTextForHeading extends StatelessWidget {
  String text;
  double fontSize;
  Color color;

  NeumorphicTextForHeading({
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicText(
      this.text,
      style: NeumorphicStyle(
        color: this.color,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: this.fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
