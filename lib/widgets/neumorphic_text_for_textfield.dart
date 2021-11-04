import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicTextForTextField extends StatelessWidget {
  String text;
  Color color;
  NeumorphicTextForTextField({required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeumorphicText(
        text,
        style: NeumorphicStyle(
          color: this.color,
        ),
        textStyle: NeumorphicTextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
