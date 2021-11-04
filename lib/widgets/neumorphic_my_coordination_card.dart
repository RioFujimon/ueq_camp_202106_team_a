import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicMyCoordinationCard extends StatelessWidget {
  String createdAt;
  List<Widget> images;

  NeumorphicMyCoordinationCard({
    required this.createdAt,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 230,
          width: 350,
          child: Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        createdAt,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: this.images,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
