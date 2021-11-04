import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_card.dart';
import 'selecting_clothes_screen.dart';

class SelectClothesCategoryForMyClothes extends StatelessWidget {
  void _transitionScreen(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectingClothesScreen(
          clothingCategory: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          leading: NeumorphicLogoutButton(),
          title: "Coordinect",
          fontSize: 30.0,
        ),
        body: Column(children: [
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/leather-jacket.png",
                    text: "ジャケット/アウター",
                  ),
                  onTap: () {
                    _transitionScreen(context, "jacket-and-outer");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/tshirt.png",
                    text: "トップス",
                  ),
                  onTap: () {
                    _transitionScreen(context, "tops");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/trousers.png",
                    text: "パンツ",
                  ),
                  onTap: () {
                    _transitionScreen(context, "pants");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/dress.png",
                    text: "ワンピース/ドレス",
                  ),
                  onTap: () {
                    _transitionScreen(context, "one-piece-and-dress");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/skirt.png",
                    text: "スカート",
                  ),
                  onTap: () {
                    _transitionScreen(context, "skirt");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/socks.png",
                    text: "ソックス",
                  ),
                  onTap: () {
                    _transitionScreen(context, "socks");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/shoes.png",
                    text: "シューズ",
                  ),
                  onTap: () {
                    _transitionScreen(context, "shoes");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/cap.png",
                    text: "帽子",
                  ),
                  onTap: () {
                    _transitionScreen(context, "cap");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/eyeglasses.png",
                    text: "メガネ",
                  ),
                  onTap: () {
                    _transitionScreen(context, "glasses");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/bracelet.png",
                    text: "アクセサリー",
                  ),
                  onTap: () {
                    _transitionScreen(context, "accessories");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/handbag.png",
                    text: "バッグ",
                  ),
                  onTap: () {
                    _transitionScreen(context, "bag");
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/hand-watch.png",
                    text: "腕時計",
                  ),
                  onTap: () {
                    _transitionScreen(context, "hand-watch");
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
