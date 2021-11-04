import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_card_from_url.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectClothesForOtherUserScreen extends StatefulWidget {
  String uid;
  String clothingCategory;
  SelectClothesForOtherUserScreen(
      {required this.uid, required this.clothingCategory});

  @override
  _SelectClothesForOtherUserScreenState createState() =>
      _SelectClothesForOtherUserScreenState();
}

class _SelectClothesForOtherUserScreenState
    extends State<SelectClothesForOtherUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          leading: NeumorphicLogoutButton(),
          title: 'Coordinect',
          fontSize: 30,
        ),
        body: buildClothesList(),
      ),
    );
  }

  Widget buildClothesList() {
    var uid = widget.uid;
    var clothingCategory = widget.clothingCategory;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("clothes")
          .doc("$uid")
          .collection("$clothingCategory")
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
            //print(clothingImageUrl);
            return GestureDetector(
              child: Center(
                child: NeumorphicCardFromUrl(
                  imagePath: clothingImageUrl,
                ),
              ),
              onTap: () {
                Navigator.pop(context, clothingImageUrl);
              },
            );
          },
        );
      },
    );
  }
}
