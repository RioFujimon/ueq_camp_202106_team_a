import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cordinate_sns_app/screens/select_my_coordination_screen.dart';
import 'package:cordinate_sns_app/widgets/custom_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_my_coordination_card.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ListOfMyCoordinationScreen extends StatefulWidget {
  String uid;

  ListOfMyCoordinationScreen({required this.uid});

  @override
  _ListOfMyCoordinationScreenState createState() =>
      _ListOfMyCoordinationScreenState();
}

class _ListOfMyCoordinationScreenState
    extends State<ListOfMyCoordinationScreen> {
  List<NeumorphicMyCoordinationCard> initVerticalList(
    List<String> createdAtList,
    List<List<dynamic>> coordinationDimList,
  ) {
    List<NeumorphicMyCoordinationCard> neumorphicMyCoordinationCardList = [];

    for (int i = 0; i < coordinationDimList.length; i++) {
      List<Widget> images =
          initHorizontalList(i, coordinationDimList[i].cast<String>());
      NeumorphicMyCoordinationCard card = NeumorphicMyCoordinationCard(
        createdAt: createdAtList[i],
        images: images,
      );
      neumorphicMyCoordinationCardList.add(card);
    }

    return neumorphicMyCoordinationCardList;
  }

  List<Widget> initHorizontalList(int i, List<String> coordinationList) {
    List<Widget> images = [];
    for (int j = 0; j < coordinationList.length; j++) {
      images.add(
        CustomNetworkImage(
          imageUrl: coordinationList[j],
          padding: 5,
          height: 125,
          width: 125,
        ),
      );
    }
    return images;
  }

  String convertFromDateTimeToString(DateTime createdAt) {
    initializeDateFormatting("ja_JP");

    var formatter = new DateFormat("yyyy/MM/dd HH:mm", "ja_JP");
    String formatted = formatter.format(createdAt);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          leading: NeumorphicLogoutButton(),
          title: "Coordinect",
          fontSize: 30,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('coordination')
              .orderBy('createdAt', descending: true)
              .where('uid', isEqualTo: widget.uid)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              Center(
                child: CircularProgressIndicator(),
              );
            }

            List<String> createdAtList = [];
            List<List<dynamic>> coordinationDimList = [];
            snapshot.data!.docs.forEach((doc) {
              String createdAt =
                  convertFromDateTimeToString(doc.get("createdAt").toDate());
              createdAtList.add(createdAt);
              List<String> coordinationList =
                  doc.get('coordination').cast<String>();
              coordinationDimList.add(coordinationList);
            });

            return ListView(
              children: initVerticalList(
                createdAtList,
                coordinationDimList,
              ),
            );
          },
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
            bottom: 50,
          ),
          child: NeumorphicFloatingActionButton(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('images/tshirt.png'),
                ),
                SizedBox(
                  height: 18,
                  width: 18,
                  child: Icon(Icons.add),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SelectMyCoordinationScreen(uid: widget.uid),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
