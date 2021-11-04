import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCardFromUrl extends StatelessWidget {
  String imagePath;

  NeumorphicCardFromUrl({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Container(
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image(
                  image: NetworkImage(this.imagePath),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
