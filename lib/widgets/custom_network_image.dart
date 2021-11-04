import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  String imageUrl;
  double padding;
  double height;
  double width;

  CustomNetworkImage({
    required this.imageUrl,
    required this.padding,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this.padding),
      child: SizedBox(
        height: this.height,
        width: this.width,
        child: Image(
          image: NetworkImage(this.imageUrl),
        ),
      ),
    );
  }
}
