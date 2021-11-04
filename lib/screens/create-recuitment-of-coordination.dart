import 'package:cordinate_sns_app/widgets/neumorphic_text_for_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_multi_line_textfield.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_button.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_bottom_navigation.dart';
import 'package:cordinate_sns_app/screens/select_how_to_registrate_clothes_screen.dart';

class CreateRecuitmentOfCoordination extends StatelessWidget {
  const CreateRecuitmentOfCoordination({Key? key}) : super(key: key);

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicTextForTextField(
                  text: "コーディネート募集するためのメッセージを入力",
                  color: Colors.black,
                ),
                NeumorphicMultiLineTextField(
                  hint: "",
                  onChanged: (value) {},
                ),
                NeumorphicTextForTextField(
                    text: "コーディネートを着る場面を入力", color: Colors.black),
                NeumorphicMultiLineTextField(
                  hint: "",
                  onChanged: (value) {},
                ),
                NeumorphicTextForTextField(
                    text: "コーディネートで使用したい服がある場合は選択", color: Colors.black),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Neumorphic(
                      padding: EdgeInsets.all(30),
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.rect(),
                        depth: NeumorphicTheme.embossDepth(context),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Image(
                                image: AssetImage("images/parker.png"),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: NeumorphicCustomButton(
                    text: "募集",
                    color: Colors.black,
                    onPressed: () {
                      print("募集");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SelectHowToRegistrateClothesScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: NeumorphicBottomNavigation(),
        ),
      ),
    );
  }
}
