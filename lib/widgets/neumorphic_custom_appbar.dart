import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  String title;
  double fontSize;

  NeumorphicCustomAppBar({required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      title: NeumorphicText(
        this.title,
        textStyle: NeumorphicTextStyle(
          fontWeight: FontWeight.bold,
          fontSize: this.fontSize,
        ),
        style: NeumorphicStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90.0);
}
