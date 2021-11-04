import 'package:flutter/material.dart';

class ImageForToggle extends StatelessWidget {
  String imagePath;
  ImageForToggle({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image(
          image: AssetImage(this.imagePath),
        ),
      ),
    );
  }
}
