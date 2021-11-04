import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ColumnContainingImageAndText extends StatelessWidget {
  String imagePath;
  String text;
  double imageWidth;
  double imageHeight;
  double fontSize;

  ColumnContainingImageAndText({
    required this.imagePath,
    required this.text,
    required this.imageHeight,
    required this.imageWidth,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: this.imageHeight,
          width: this.imageWidth,
          child: Image(
            image: AssetImage(this.imagePath),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: NeumorphicText(
            this.text,
            style: NeumorphicStyle(color: Colors.black),
            textStyle: NeumorphicTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: this.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
