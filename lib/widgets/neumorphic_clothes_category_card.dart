import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicClothesCategoryCard extends StatelessWidget {
  String title;
  String category;
  List<Widget> images;
  Function onPressed;

  NeumorphicClothesCategoryCard({
    required this.title,
    required this.category,
    required this.images,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            SizedBox(
              height: 200,
              width: 350,
              child: Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NeumorphicText(
                        this.title,
                        style: NeumorphicStyle(
                          color: Colors.black,
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: this.images,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 50,
                child: NeumorphicFloatingActionButton(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: Icon(Icons.add),
                  onPressed: () => this.onPressed(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
