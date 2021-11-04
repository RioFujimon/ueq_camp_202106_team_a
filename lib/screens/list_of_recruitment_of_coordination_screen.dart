import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordinate_sns_app/screens/create-recruitment-of-coordination.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_recruitment_card.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_bottom_navigation.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ListOfRecruitmentOfCoordinationScreen extends StatefulWidget {
  String beforePageName;

  ListOfRecruitmentOfCoordinationScreen({required this.beforePageName});

  @override
  _ListOfRecruitmentOfCoordinationScreenState createState() =>
      _ListOfRecruitmentOfCoordinationScreenState();
}

class _ListOfRecruitmentOfCoordinationScreenState
    extends State<ListOfRecruitmentOfCoordinationScreen> {
  List<NeumorphicRecruitmentCard> initVerticalList(
      List<String> uidList,
      List<String> nameList,
      List<String> profileImageUrlList,
      List<String> createdAtList,
      List<String> recruitmentMessageList) {
    List<NeumorphicRecruitmentCard> neumorphicRecruitmentCardList = [];

    for (int i = 0; i < recruitmentMessageList.length; i++) {
      NeumorphicRecruitmentCard card = NeumorphicRecruitmentCard(
        uid: uidList[i],
        name: nameList[i],
        profileImageUrl: profileImageUrlList[i],
        createdAt: createdAtList[i],
        recruitmentMessage: recruitmentMessageList[i],
      );
      neumorphicRecruitmentCardList.add(card);
    }

    return neumorphicRecruitmentCardList;
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
                .collection('recruitment')
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
              List<String> recruitmentMessageList = [];

              snapshot.data!.docs.forEach((doc) {
                uidList.add(doc.get("uid"));
                nameList.add(doc.get("userName"));
                profileImageUrlList.add(doc.get("profileImageUrl"));
                String createdAt =
                    convertFromDateTimeToString(doc.get("createdAt").toDate());
                createdAtList.add(createdAt);
                recruitmentMessageList.add(doc.get("recruitmentMessage"));
              });

              return ListView(
                children: initVerticalList(
                  uidList,
                  nameList,
                  profileImageUrlList,
                  createdAtList,
                  recruitmentMessageList,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('images/promotion.png'),
                    ),
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
                    builder: (context) => CreateRecruitmentOfCoordination(),
                  ),
                );
              },
            ),
          ),
          bottomSheet: NeumorphicBottomNavigation(
            selectedIndex: 2,
            beforePageName: widget.beforePageName,
          ),
        ),
      ),
    );
  }
}
