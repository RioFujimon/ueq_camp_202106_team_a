import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/image_for_toggle.dart';

class NeumorphicBottomNavigation extends StatefulWidget {
  const NeumorphicBottomNavigation({Key? key}) : super(key: key);

  @override
  _NeumorphicBottomNavigationState createState() =>
      _NeumorphicBottomNavigationState();
}

class _NeumorphicBottomNavigationState
    extends State<NeumorphicBottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NeumorphicToggle(
      height: 50,
      selectedIndex: _selectedIndex,
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
          _selectedIndex = value;
          print(_selectedIndex);
        });
      },
    );
  }
}
