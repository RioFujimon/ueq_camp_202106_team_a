import 'package:cordinate_sns_app/screens/select_how_to_registrate_clothes_screen.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_card_from_url.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_floating_action_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectingClothesScreen extends StatefulWidget {
  @override
  _SelectingClothesScreenState createState() => _SelectingClothesScreenState();

  String clothingCategory;
  SelectingClothesScreen({required this.clothingCategory});
}

class _SelectingClothesScreenState extends State<SelectingClothesScreen> {
  String uid = "";

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
    void screenTransition() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectHowToRegistrateClothesScreen(
                clothingCategory: widget.clothingCategory),
          ));
    }

    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          leading: NeumorphicLogoutButton(),
          title: "Coordinect",
          fontSize: 30.0,
        ),
        body: buildClothesList(),
        floatingActionButton: NeumorphicCustomFloatingActionButton(
          onPressed: () => screenTransition,
        ),
      ),
    );
  }

  Widget buildClothesList() {
    uid = getUidOfCurrentUser();
    var clothingCategory = widget.clothingCategory;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("clothes")
          .doc(uid)
          .collection(clothingCategory)
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: snapshot.data!.docs.length,
          padding: const EdgeInsets.all(2),
          itemBuilder: (BuildContext context, int index) {
            var clothingImageUrl =
                snapshot.data!.docs[index].get('clothingImageUrl');
            return Center(
              child: NeumorphicCardFromUrl(
                imagePath: clothingImageUrl,
              ),
            );
          },
        );
      },
    );
  }
}
