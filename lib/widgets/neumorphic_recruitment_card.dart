import 'package:flutter/material.dart';
import 'package:cordinate_sns_app/screens/select_coordination_for_other_user_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicRecruitmentCard extends StatelessWidget {
  String uid;
  String name;
  String profileImageUrl;
  String createdAt;
  String recruitmentMessage;

  NeumorphicRecruitmentCard({
    required this.uid,
    required this.name,
    required this.profileImageUrl,
    required this.createdAt,
    required this.recruitmentMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 230,
          width: 350,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SelectCoordinationForOtherUserScreen(uid: this.uid),
                ),
              );
            },
            child: Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(profileImageUrl),
                                  )),
                            ),
                          ),
                          Text(
                            this.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          this.createdAt,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          recruitmentMessage,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
