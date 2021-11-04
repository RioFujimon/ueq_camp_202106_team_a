import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCustomButton extends StatelessWidget {
  String text;
  Color color;
  Function onPressed;

  NeumorphicCustomButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 200,
      child: NeumorphicButton(
        child: NeumorphicText(
          text,
          textStyle: NeumorphicTextStyle(fontWeight: FontWeight.bold),
          style: NeumorphicStyle(color: this.color),
        ),
        onPressed: () {
          this.onPressed();
        },
      ),
    );
  }
}
