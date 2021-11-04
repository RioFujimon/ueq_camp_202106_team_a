import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_text_for_heading.dart';
import 'package:cordinate_sns_app/widgets/column_containing_image_and_text.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_bottom_navigation.dart';

class SelectHowToRegistrateClothesScreen extends StatelessWidget {
  const SelectHowToRegistrateClothesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      home: SafeArea(
        child: Scaffold(
          appBar: NeumorphicCustomAppBar(
            title: "Coordinate App",
            fontSize: 30.0,
          ),
          body: Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.rect(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeumorphicTextForHeading(
                      text: "服の登録方法を選択",
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: ColumnContainingImageAndText(
                            imagePath: "images/camera.png",
                            text: "撮影して登録",
                            imageHeight: 90.0,
                            imageWidth: 90.0,
                            fontSize: 15.0,
                          ),
                          onTap: () {
                            print("撮影して登録");
                          },
                        ),
                        GestureDetector(
                          child: ColumnContainingImageAndText(
                            imagePath: "images/album.png",
                            text: "ライブラリから登録",
                            imageHeight: 90.0,
                            imageWidth: 90.0,
                            fontSize: 15.0,
                          ),
                          onTap: () {
                            print("ライブラリから選択");
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: NeumorphicBottomNavigation(),
        ),
      ),
    );
  }
}
