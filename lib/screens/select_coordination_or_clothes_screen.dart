import 'package:cordinate_sns_app/screens/list_of_my_coordination_screen.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:flutter/material.dart';
import 'package:cordinate_sns_app/screens/select_clothes_category_for_my_clothes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_card.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_bottom_navigation.dart';

class SelectCoordinationOrClothesScreen extends StatefulWidget {
  String beforePageName;

  SelectCoordinationOrClothesScreen({required this.beforePageName});

  @override
  _SelectCoordinationOrClothesScreenState createState() =>
      _SelectCoordinationOrClothesScreenState();
}

class _SelectCoordinationOrClothesScreenState
    extends State<SelectCoordinationOrClothesScreen>
    with AutomaticKeepAliveClientMixin {
  String getUidOfCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return "";
    } else {
      String uid = user.uid;
      return uid;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: NeumorphicCustomAppBar(
            leading: NeumorphicLogoutButton(),
            title: "Coordinect",
            fontSize: 30.0,
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/add_coordination.png",
                    text: "コーディネート一覧",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListOfMyCoordinationScreen(
                          uid: getUidOfCurrentUser(),
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: NeumorphicCard(
                    imagePath: "images/tshirt.png",
                    text: "服一覧",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectClothesCategoryForMyClothes(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: NeumorphicBottomNavigation(
            selectedIndex: 1,
            beforePageName: widget.beforePageName,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
