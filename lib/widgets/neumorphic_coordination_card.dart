import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCoordinationCard extends StatelessWidget {
  List<Widget> images;
  String name;
  String profileImageUrl;
  String createdAt;

  NeumorphicCoordinationCard({
    required this.images,
    required this.name,
    required this.profileImageUrl,
    required this.createdAt,
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(profileImageUrl),
                                )),
                          ),
                        ),
                        Text(
                          this.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        this.createdAt,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
