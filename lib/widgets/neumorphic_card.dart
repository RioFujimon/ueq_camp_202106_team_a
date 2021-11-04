import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCard extends StatelessWidget {
  String imagePath;
  String text;

  NeumorphicCard({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Container(
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.rect(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image(
                  image: AssetImage(this.imagePath),
                ),
              ),
              NeumorphicText(
                this.text,
                textStyle: NeumorphicTextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                style: NeumorphicStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
