import 'package:cordinate_sns_app/screens/selecting_clothes_for_recuitment_screen.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_card.dart';

class SelectClothesCategoryForChoosingClothesScreen extends StatelessWidget {
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
                    var test = Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "jacket-and-outer",
                        ),
                      ),
                    );
                    test.then((value) => Navigator.pop(context, value));
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/tshirt.png",
                    text: "トップス",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "tops",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/trousers.png",
                    text: "パンツ",
                  ),
                  onTap: () async {
                    var test = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "pants",
                        ),
                      ),
                    );
                    print(test);
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/dress.png",
                    text: "ワンピース/ドレス",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "one-piece-and-dress",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/skirt.png",
                    text: "スカート",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "skirt",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/socks.png",
                    text: "ソックス",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "socks",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/shoes.png",
                    text: "シューズ",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "shoes",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/cap.png",
                    text: "帽子",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "cap",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/eyeglasses.png",
                    text: "メガネ",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "glasses",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/bracelet.png",
                    text: "アクセサリー",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "accessories",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/handbag.png",
                    text: "バッグ",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                          clothingCategory: "bag",
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/hand-watch.png",
                    text: "腕時計",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectingClothesForRecruitmentScreen(
                                clothingCategory: "hand-watch"),
                      ),
                    );
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
