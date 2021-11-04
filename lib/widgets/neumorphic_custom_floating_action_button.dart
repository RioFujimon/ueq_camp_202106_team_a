import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCustomFloatingActionButton extends StatelessWidget {
  Function onPressed;

  NeumorphicCustomFloatingActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NeumorphicFloatingActionButton(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image(
                image: AssetImage("images/tshirt.png"),
              ),
            ),
            Center(
              child: SizedBox(
                height: 18,
                width: 18,
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      onPressed: this.onPressed(),
    );
  }
}
