import 'package:cordinate_sns_app/widgets/custom_network_image.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_bottom_navigation.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_coordination_card.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeScreen extends StatefulWidget {
  String beforePageName;

  HomeScreen({required this.beforePageName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NeumorphicCoordinationCard> initVerticalList(
      List<String> nameList,
      List<String> profileImageUrlList,
      List<String> createdAtList,
      List<List<dynamic>> coordinationDimList) {
    List<NeumorphicCoordinationCard> neumorphicCoordinationCardList = [];

    for (int i = 0; i < coordinationDimList.length; i++) {
      List<Widget> images =
          initHorizontalList(i, coordinationDimList[i].cast<String>());
      NeumorphicCoordinationCard card = NeumorphicCoordinationCard(
        images: images,
        name: nameList[i],
        profileImageUrl: profileImageUrlList[i],
        createdAt: createdAtList[i],
      );
      neumorphicCoordinationCardList.add(card);
    }

    return neumorphicCoordinationCardList;
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
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
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

              List<String> uidList = [];
              List<String> nameList = [];
              List<String> profileImageUrlList = [];
              List<String> createdAtList = [];
              List<List<dynamic>> coordinationDimList = [];

              snapshot.data!.docs.forEach((doc) {
                uidList.add(doc.get("uid"));
                nameList.add(doc.get("userName"));
                profileImageUrlList.add(doc.get("profileImageUrl"));
                String createdAt =
                    convertFromDateTimeToString(doc.get("createdAt").toDate());
                createdAtList.add(createdAt);
                List<String> coordinationList =
                    doc.get('coordination').cast<String>();
                coordinationDimList.add(coordinationList);
              });

              return ListView(
                children: initVerticalList(
                  nameList,
                  profileImageUrlList,
                  createdAtList,
                  coordinationDimList,
                ),
              );
            },
          ),
          bottomSheet: NeumorphicBottomNavigation(
            selectedIndex: 0,
            beforePageName: widget.beforePageName,
          ),
        ),
      ),
    );
  }
}
