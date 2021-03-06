import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_button.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_logout_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/screens/select_clothes_for_other_user_screen.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_clothes_category_card.dart';
import 'package:cordinate_sns_app/widgets/custom_network_image.dart';

class SelectCoordinationForOtherUserScreen extends StatefulWidget {
  String uid;

  SelectCoordinationForOtherUserScreen({required this.uid});

  @override
  _SelectCoordinationForOtherUserScreenState createState() =>
      _SelectCoordinationForOtherUserScreenState();
}

class _SelectCoordinationForOtherUserScreenState
    extends State<SelectCoordinationForOtherUserScreen> {
  List<String> jacketAndOuterImageUrlList = [];
  List<String> topsImageUrlList = [];
  List<String> pantsImageUrlList = [];
  List<String> onePieceAndDressImageUrlList = [];
  List<String> skirtImageUrlList = [];
  List<String> socksImageUrlList = [];
  List<String> shoesImageUrlList = [];
  List<String> capImageUrlList = [];
  List<String> accessoriesImageUrlList = [];
  List<String> handWatchImageUrlList = [];
  List<String> glassesImageUrlList = [];
  List<String> bagImageUrlList = [];

  List<Widget> displayInitImages(String imagePath) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 80,
          width: 80,
          child: Image(
            image: AssetImage(imagePath),
          ),
        ),
      ),
    ];
  }

  List<Widget> displayImages(String imagePath, List<String> list) {
    List<Widget> images = [];
    if (list.length == 0) {
      return displayInitImages(imagePath);
    } else {
      for (int i = 0; i < list.length; i++) {
        images.add(
          CustomNetworkImage(
            imageUrl: list[i],
            padding: 5,
            height: 125,
            width: 125,
          ),
        );
      }
      return images;
    }
  }

  String getUidOfCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return "";
    } else {
      String uid = user.uid;
      return uid;
    }
  }

  Future<String> getUserNameFromFirestore(String uid) async {
    String _userName = "";
    CollectionReference _users = FirebaseFirestore.instance.collection("users");
    await _users.doc(uid).get().then((doc) {
      _userName = doc.get('userName');
    });

    return Future.value(_userName);
  }

  Future<String> getProfileImageUrlFromFirestore(String uid) async {
    String _profileImageUrl = "";
    CollectionReference _users = FirebaseFirestore.instance.collection("users");
    await _users.doc(uid).get().then((doc) {
      _profileImageUrl = doc.get('profileImageUrl');
    });

    return Future.value(_profileImageUrl);
  }

  Future<void> postCoordinationDataToFireStore(String uid) async {
    List<String> coordinationList = this.jacketAndOuterImageUrlList +
        this.topsImageUrlList +
        this.pantsImageUrlList +
        this.onePieceAndDressImageUrlList +
        this.skirtImageUrlList +
        this.socksImageUrlList +
        this.shoesImageUrlList +
        this.capImageUrlList +
        this.accessoriesImageUrlList +
        this.handWatchImageUrlList +
        this.glassesImageUrlList +
        this.bagImageUrlList;

    String userName = await getUserNameFromFirestore(widget.uid);
    String profileImageUrl = await getProfileImageUrlFromFirestore(widget.uid);

    if (coordinationList.isNotEmpty) {
      CollectionReference _coordination =
          FirebaseFirestore.instance.collection('coordination');

      _coordination
          .doc()
          .set({
            'uid': uid,
            'userName': userName,
            'profileImageUrl': profileImageUrl,
            'coordination': coordinationList,
            'createdAt': Timestamp.fromDate(DateTime.now()),
          })
          .then((value) => initLists())
          .catchError((error) =>
              print('Failed to post coordination data to Firestore.???$error'));
    }
  }

  void initLists() {
    setState(() {
      this.jacketAndOuterImageUrlList.clear();
      this.topsImageUrlList.clear();
      this.pantsImageUrlList.clear();
      this.onePieceAndDressImageUrlList.clear();
      this.skirtImageUrlList.clear();
      this.socksImageUrlList.clear();
      this.shoesImageUrlList.clear();
      this.capImageUrlList.clear();
      this.accessoriesImageUrlList.clear();
      this.handWatchImageUrlList.clear();
      this.glassesImageUrlList.clear();
      this.bagImageUrlList.clear();
    });
  }

  Future<void> screenTransition(
      String uid, String clothingCategory, List<String> list) async {
    var imageUrl = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectClothesForOtherUserScreen(
            uid: uid,
            clothingCategory: clothingCategory,
          ),
        ));

    if (imageUrl == null) {
      imageUrl = "";
    }

    addClothesImageUrlToList(list, imageUrl);
  }

  void addClothesImageUrlToList(List<String> list, String imageUrl) {
    if (imageUrl.isNotEmpty && !list.contains(imageUrl)) {
      setState(() {
        list.add(imageUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          leading: NeumorphicLogoutButton(),
          title: 'Coordinect',
          fontSize: 30,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    NeumorphicClothesCategoryCard(
                      title: "???????????????/????????????",
                      category: "jacket-and-outer",
                      images: displayImages(
                        'images/leather-jacket.png',
                        this.jacketAndOuterImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "jacket-and-outer",
                        this.jacketAndOuterImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "????????????",
                      category: "tops",
                      images: displayImages(
                        "images/tshirt.png",
                        this.topsImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "tops",
                        this.topsImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "?????????",
                      category: "pants",
                      images: displayImages(
                        'images/trousers.png',
                        this.pantsImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "pants",
                        this.pantsImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "???????????????/?????????",
                      category: "one-piece-and-dress",
                      images: displayImages(
                        'images/dress.png',
                        this.onePieceAndDressImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "one-piece-and-dress",
                        this.onePieceAndDressImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "????????????",
                      category: "skirt",
                      images: displayImages(
                        'images/skirt.png',
                        this.skirtImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "skirt",
                        this.skirtImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "????????????",
                      category: "socks",
                      images: displayImages(
                        'images/socks.png',
                        this.socksImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "socks",
                        this.socksImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "????????????",
                      category: "shoes",
                      images: displayImages(
                        'images/shoes.png',
                        this.shoesImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "shoes",
                        this.shoesImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "??????",
                      category: "cap",
                      images: displayImages(
                        'images/cap.png',
                        this.capImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "cap",
                        this.capImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "??????????????????",
                      category: "accessories",
                      images: displayImages(
                        'images/bracelet.png',
                        this.accessoriesImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "accessories",
                        this.accessoriesImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "??????",
                      category: "hand-watch",
                      images: displayImages(
                        'images/hand-watch.png',
                        this.handWatchImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "hand-watch",
                        this.handWatchImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "??????",
                      category: "glasses",
                      images: displayImages(
                        'images/eyeglasses.png',
                        this.glassesImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "glasses",
                        this.glassesImageUrlList,
                      ),
                    ),
                    NeumorphicClothesCategoryCard(
                      title: "?????????",
                      category: "bag",
                      images: displayImages(
                        'images/handbag.png',
                        this.bagImageUrlList,
                      ),
                      onPressed: () => screenTransition(
                        widget.uid,
                        "bag",
                        this.bagImageUrlList,
                      ),
                    ),
                  ],
                ),
              ),
              NeumorphicCustomButton(
                text: "??????",
                color: Colors.black,
                onPressed: () => postCoordinationDataToFireStore(widget.uid),
              )
            ],
          ),
        ),
      ),
    );
  }
}
