import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'custom_material_page_route.dart';
import 'package:cordinate_sns_app/screens/login_screen.dart';

class NeumorphicLogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          CustomMaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (_) => false,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: NeumorphicIcon(
          Icons.logout,
          style: NeumorphicStyle(color: Colors.black),
          size: 30,
        ),
      ),
    );
  }
}
