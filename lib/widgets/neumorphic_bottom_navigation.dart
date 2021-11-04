import 'package:cordinate_sns_app/screens/home_screen.dart';
import 'package:cordinate_sns_app/screens/list_of_recruitment_of_coordination_screen.dart';
import 'package:cordinate_sns_app/screens/list_of_recruitment_of_coordination_screen.dart';
import 'package:cordinate_sns_app/screens/select_coordination_or_clothes_screen.dart';
import 'package:cordinate_sns_app/widgets/custom_material_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/image_for_toggle.dart';

class NeumorphicBottomNavigation extends StatefulWidget {
  int selectedIndex;
  String beforePageName;
  NeumorphicBottomNavigation(
      {required this.selectedIndex, required this.beforePageName});

  @override
  _NeumorphicBottomNavigationState createState() =>
      _NeumorphicBottomNavigationState();
}

class _NeumorphicBottomNavigationState
    extends State<NeumorphicBottomNavigation> {
  bool _isFirstClick = false;

  void screenTransition(int selectedIndex) {
    if ((selectedIndex == 0) &&
        (widget.selectedIndex == selectedIndex) &&
        (widget.beforePageName != "home")) {
      widget.beforePageName = "home";
      Navigator.pushAndRemoveUntil(
        context,
        CustomMaterialPageRoute(
          builder: (context) => HomeScreen(
            beforePageName: widget.beforePageName,
          ),
        ),
        (_) => false,
      );
    } else if ((selectedIndex == 1) &&
        (widget.selectedIndex == selectedIndex) &&
        (widget.beforePageName != "coordination or clothes")) {
      widget.beforePageName = "coordination or clothes";
      Navigator.pushAndRemoveUntil(
        context,
        CustomMaterialPageRoute(
          builder: (context) => SelectCoordinationOrClothesScreen(
            beforePageName: widget.beforePageName,
          ),
        ),
        (_) => false,
      );
    } else if ((selectedIndex == 2) &&
        (widget.selectedIndex == selectedIndex) &&
        (widget.beforePageName != "list of recruitment")) {
      widget.beforePageName = "list of recruitment";
      Navigator.pushAndRemoveUntil(
        context,
        CustomMaterialPageRoute(
          builder: (context) => ListOfRecruitmentOfCoordinationScreen(
            beforePageName: widget.beforePageName,
          ),
        ),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicToggle(
      height: 50,
      selectedIndex: widget.selectedIndex,
      displayForegroundOnlyIfSelected: true,
      thumb: Neumorphic(),
      children: [
        ToggleElement(
          background: ImageForToggle(
            imagePath: "images/home.png",
          ),
          foreground: ImageForToggle(
            imagePath: "images/home.png",
          ),
        ),
        ToggleElement(
          background: ImageForToggle(
            imagePath: "images/tshirt.png",
          ),
          foreground: ImageForToggle(
            imagePath: "images/tshirt.png",
          ),
        ),
        ToggleElement(
          background: ImageForToggle(
            imagePath: "images/recruitment.png",
          ),
          foreground: ImageForToggle(
            imagePath: "images/recruitment.png",
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          widget.selectedIndex = value;
          screenTransition(widget.selectedIndex);
        });
      },
    );
  }
}
