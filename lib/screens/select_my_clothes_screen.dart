import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_card_from_url.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectMyClothesScreen extends StatefulWidget {
  String uid;
  String clothingCategory;
  SelectMyClothesScreen({required this.uid, required this.clothingCategory});

  @override
  _SelectMyClothesScreenState createState() => _SelectMyClothesScreenState();
}

class _SelectMyClothesScreenState extends State<SelectMyClothesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          title: 'Coordinate App',
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
                // int count = 0;
                // Navigator.popUntil(context, (_) => count++ >= 2);
                Navigator.pop(context, clothingImageUrl);
              },
            );
          },
        );
      },
    );
  }
}
